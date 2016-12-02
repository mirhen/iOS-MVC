//
//  ToDoListTableViewController.swift
//  To Do
//
//  Created by Miriam Hendler on 11/18/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

//    var dataString = "April 1, 2015"
//    var dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM-dd-yyyy"
//    dateFormatter.timeZone = NSTimeZone.localTimeZone()
    
    // convert string into date
//    let dateValue = dateFormatter.dateFromString(dataString) as Date!
    
    var toDoList: [ToDo] = [
    ToDo(title: "Go to mall", date: Date(), didCompleteTask: false),
    ToDo(title: "Go to store", date: Date(), didCompleteTask: true),
    ToDo(title: "Buy apples", date: Date(), didCompleteTask: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoTableViewCell
        let toDo = toDoList[indexPath.row]
        cell.currentToDo = toDo
        cell.tableViewController = self
        // Configure the cell...
        return cell
    }
    
    func updateTask(forToDo: ToDo)  {
        switch forToDo.didCompleteTask {
        case true:
            forToDo.didCompleteTask = false
        default:
            forToDo.didCompleteTask = true
        }
        tableView.reloadData()
        print(forToDo.didCompleteTask)
        print("button pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewToDoViewController {
            if segue.identifier == "AddToDoSegue" {
            destination.newToDo = addToDo(todo: )
            }
            
        }
    }
    
    func addToDo(todo: ToDo) {
        print("save button pressed")
        self.toDoList.append(todo)
        self.tableView.reloadData()
    }

 

}
