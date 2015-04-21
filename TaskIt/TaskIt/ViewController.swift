//
//  ViewController.swift
//  TaskIt
//
//  Created by Diaz Orona, Jesus A. on 4/17/15.
//  Copyright (c) 2015 JADO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var baseArray:[[TaskModel]] = []
//    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 01, day: 14)
        let date2 = Date.from(year: 2014, month: 03, day: 13)
        let date3 = Date.from(year: 2014, month: 07, day: 11)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1, completed:false)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burguers", date: date2, completed:false)
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: date2, completed:false)

        let taskArray = [task1,task2,task3]
        
        var taskCompleted1 = TaskModel(task:"Call",subTask:"tomorrow",date:date1,completed:true)
        var completedTaskArray = [taskCompleted1]
        
        baseArray = [taskArray,completedTaskArray]

        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        baseArray[0] = baseArray[0].sorted{
         (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        baseArray[1] = baseArray[1].sorted{
            (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
        }else if segue.identifier == "addTaskSegue" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    

    //    TableView Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        var taskDict:TaskModel = baseArray[indexPath.section][indexPath.row]
        
        cell.taskLabel.text = taskDict.task
        cell.subTaskLabel.text = taskDict.subTask
        cell.dateLabel.text = Date.toString(date: taskDict.date)
        return cell
    }
    
    //    TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To do"
        } else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        var newTask = thisTask
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        
        if indexPath.section == 0{
            newTask.completed = true
            baseArray[1].append(newTask)
        } else {
            newTask.completed = false
            baseArray[0].append(newTask)
        }
        tableView.reloadData()
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addTaskSegue", sender: self)
    }
    
    
    
}

