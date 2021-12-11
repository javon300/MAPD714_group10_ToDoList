/**
 MAPD714        assignment 2
 group 10
 Members
 Matthew Maxwell
 Divyesh Solanki
 poojan Patel
 
 
 date: Dec 7, 2022
 
 description:
    this controller controlls the secondary screen used to add data to database
 **/
import UIKit
import Firebase
import FirebaseFirestore


//View Controller for main page in app
class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate
{
    //   *****************************firebase***************************************************************
    var task:Task?

    private var service: UserService?
    private var allTasks = [Task]() {
       didSet {
           DispatchQueue.main.async {
               self.tasks = self.allTasks
           }
       }
    }

    var tasks = [Task]() {
       didSet {
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
       }
    }
    //loads data from database via userService constructor
    func loadData() {
          service = UserService()
          service?.get(collectionID: "taskList") { tasks in
              self.allTasks = tasks
          }
      }
//    func delData()
//    {
//          service = UserService()
//        service?.delete()
//    }
      
    
    let tableView = UITableView()
      
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    //sets table constraints
    func setupTableView()
    {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }

    //calculates table length based on input count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return tasks.count
    }

       
    //
    //   ********************************************************************************************


    // String table identifier/Users/jay/Library/Developer/Xcode/DerivedData/MAPD711_group10_ToDoList-dmhvlrgqoudshdajzxfecagncwka/SourcePackages/checkouts/GoogleAppMeasurement
    //**************************************************************
    let tasksTableIdentifier = "tasksTable"


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
        cell?.textLabel?.text = tasks[indexPath.row].name

        //adds date as sudtext
        cell?.detailTextLabel?.text = tasks[indexPath.row].dueDate

        //adds image to be displayed in cell
        let editImage = UIImage(named: "edit")
        cell?.imageView?.image = editImage
        return cell!
    }



    //edit actions for gestures
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

    // Complete action swipe
       let completeAction = UITableViewRowAction(style: .default, title: "Complete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in


       })
        completeAction.backgroundColor = UIColor.yellow

        // delete button
       let deleteAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in

        tableView.beginUpdates()
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
           self.service?.delete()
       })


        
        return [deleteAction,completeAction]

    }

    //navigation control to edit page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailsView = segue.destination as! DetailViewController
        detailsView.taskString = sender as! String
    }



}

//    //what happens when row is selected
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        //animates a deselction of selected item then navigates to second page
//        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "navigate", sender: tasks[indexPath.row])
//    }
