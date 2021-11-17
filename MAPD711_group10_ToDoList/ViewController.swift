//
//  ViewController.swift
//  MAPD711_group10_ToDoList
//
//  Created by javon maxwell on 2021-11-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate
{
   //outlet declaration for tableview
   // @IBOutlet var tableView:UITableView!
    
    //array of key value pairs (DICTIONARIES)
    private let tasks =
    [
        ["Task": "wash hair", "Date": "12/20/2022"],
        ["Task": "read a book", "Date": "04/20/2021"],
        ["Task": "purchase game ticket", "Date": "12/20/2021"],
        ["Task": "hair appointment", "Date": "12/12/2022"],
        ["Task": "Spa appointment", "Date": "11/20/2021"],
        ["Task": "match day", "Date": ""],
    ]
    private let tak = ["head", "shoulder", "knees", "toes"]
    //table identifier
        let tasksTableIdentifier = "tasksTable"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    
    //overide function for table length via item count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tak.count
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
        cell?.textLabel?.text = tak[indexPath.row]
        
        //adds date as sudtext

        
        //adds image to be displayed in cell
        let editImage = UIImage(named: "edit")
        cell?.imageView?.image = editImage
       
        
        //adds switch to be displayed in cell
        let taskCompleted = UISwitch(frame: .zero)
        taskCompleted.setOn(false, animated: true)
        //taskCompleted.tag = indexPath.row // for detect which row switch Changed
        //taskCompleted.addTarget(self, action: tasks(self.switchChanged(_:)), for: .valueChanged)
        cell?.accessoryView = taskCompleted
        return cell!
    }

}

