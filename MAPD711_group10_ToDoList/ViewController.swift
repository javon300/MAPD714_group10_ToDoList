/**
 MAPD714        assignment 2
 group 10
 Members
 Matthew Maxwell
 Divyesh Solanki
 poojan Patel
 **/
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
    
    
    //function renders array on app start up
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //instantiaate reusable cell
        var cell = tableView.dequeueReusableCell(withIdentifier: tasksTableIdentifier)
        if(cell == nil)
        {
            //actual instance creation
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: tasksTableIdentifier)
        }
     
        //adds task title to be displayed
        cell?.textLabel?.text = taskList[indexPath.row]
        
        //adds date as sudtext
        cell?.detailTextLabel?.text = "24/04/2002"
        
        //adds image to be displayed in cell
        let editImage = UIImage(named: "edit")
        cell?.imageView?.image = editImage
       
        //adds switch to be displayed in cell
        let taskCompleted = UISwitch(frame: .zero)
        taskCompleted.setOn(false, animated: true)
        cell?.accessoryView = taskCompleted
        
        return cell!
    }
    
    //what happens when row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //animates a deselction of selected item then navigates to second page
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "navigate", sender: taskList[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailsView = segue.destination as! DetailViewController
        detailsView.taskString = sender as! String
    }

}

