//
//  ViewController.swift
//  MAPD711_group10_ToDoList
//
//  Created by javon maxwell on 2021-11-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate

{   //array of tasks
    private let taskList = ["head", "shoulder", "knees", "toes"]
    
    // String table identifier
    let tasksTableIdentifier = "tasksTable"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    
    //overide function for table length via item count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskList.count
    }
    
    
    //overide function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //instantiaate reusable cell
        var cell = tableView.dequeueReusableCell(withIdentifier: tasksTableIdentifier)
        if(cell == nil)
        {
            //actual instance creation
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: tasksTableIdentifier)
        }
     
        //adds tasks to be displayed
        cell?.textLabel?.text = taskList[indexPath.row]
        
        //adds date as sudtext
        cell?.detailTextLabel?.text = "24/04/2002"
        
        //adds image to be displayed in cell
        let editImage = UIImage(named: "edit")
        cell?.imageView?.image = editImage
       
        
        //adds switch to be displayed in cell
        let taskCompleted = UISwitch(frame: .zero)
        taskCompleted.setOn(false, animated: true)
        
        //taskCompleted.tag = indexPath.row // for detect which row switch Changed
        //taskCompleted.addTarget(self, action: tasks(self.switchChanged(_:)), for: .valueChanged)
        cell?.accessoryView = taskCompleted
        
        performSegue(withIdentifier: "navigate", sender: taskList[indexPath.row])
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailsView = segue.destination as! DetailViewController
        detailsView.taskString = sender as! String
    }

}

