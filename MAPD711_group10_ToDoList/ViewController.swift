//view
/**
 MAPD714        assignment 2
 group 10
 Members
 Matthew Maxwell
 Divyesh Solanki
 poojan Patel
 **/
import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate
//class ViewController: UIViewController
{
    var name: String?
    var notes: String?
   // array of tasks
    var taskList = [Task]()
    //var task: Task!
    // String table identifier
    let tasksTableIdentifier = "tasksTable"
   
    //db reference
    var docRef: DocumentReference!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //doc reference instance
       // docRef = Firestore.firestore().collection("taskList").document("YEPz9PPL6QfxnnXKdNlO")
       //fetchData()
        //getData()
//        docRef.getDocument { (docSnapshot, error) in
//        guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
//        let myData = docSnapshot.data()
//        let lName = myData?["name"] as? String ?? ""
//        let lNotes = myData?["notes"] as? String ?? ""
//        let lIsCompleted = myData?["isCompleted"] as? Bool ?? false
//        let lHasDueDate = myData?["hasDueDate"] as? Bool ?? false
//        let lDate = myData?["dueDate"] as? Bool ?? false
//        self.taskList[1].name = lName
//
//            print( "\"\(lName)\" --- \(lDate)")
//        }
        
    }
        
    
    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        //dispose of resources that can be recreated
//    }
    
    
//    override func viewWillAppear(_ animated: Bool)
//    {
//        super.viewWillAppear(animated)
//
//
//    }
    //**************************************************************************
    //
//    func getData()
//    {
//        //ref database
//
//        docRef = Firestore.firestore().collection("taskList").getDocuments { snapshot, error in
//            if error == nil{
//                if let snapshot = snapshot{
//                    //returns async code to main thread
//                    DispatchQueue.main.async {
//                        self.taskList = snapshot.documents.map { d in
//                            return Task(id: d.documentID,
//                                        name: d["name"] as? String ?? "",
//                                        isComplete: d["isCompleted"] as? Bool ?? true,
//                                        notes: d["notes"] as? String ?? "",
//                                        hasDueDate: d["hasDueDate"] as? Bool ?? true,
//                                        dueDate: d["dueDate"] as? String ?? "")
//                        }
//                    //get all documents if not empty
//
//                    }
//                }
//
//            }
//        }
//    }

    //**************************************************************************






    //***********************************************************************************
    //array of tasks

//    func fetchData()
//    {
//        docRef.getDocument { (docSnapshot, error) in
//            guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
//            let myData = docSnapshot.data()
//            self.taskList[0].name = myData?["name"] as? String ?? ""
//            self.taskList[0].notes = myData?["notes"] as? String ?? ""
//            self.taskList[0].isComplete = myData?["isCompleted"] as? Bool ?? false
//            self.taskList[0].hasDueDate = myData?["hasDueDate"] as? Bool ?? false
//            self.taskList[0].dueDate = myData?["dueDate"] as? String ?? ""
//            //taskList.insert(lName, at: 0)
//            printContent(Any?)
//
//        }
//    }


    //overide function for table length via item count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return taskList.count//should be record count
    }


    //function renders array on app start up
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        //instantiaate reusable cell
        var cell = tableView.dequeueReusableCell(withIdentifier: tasksTableIdentifier)
        let task: Task
        task = taskList[indexPath.row]
        if(cell == nil)
        {
            //actual instance creation
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: tasksTableIdentifier)
        }

        //adds task title to be displayed
        cell?.textLabel?.text = task.name

        //adds date as sudtext
        cell?.detailTextLabel?.text = task.dueDate

        //adds image to be displayed in cell
        let editImage = UIImage(named: "edit")
        cell?.imageView?.image = editImage

        //adds switch to be displayed in cell
        let taskCompleted = UISwitch(frame: .zero)
        taskCompleted.setOn(false, animated: true)
        cell?.accessoryView = taskCompleted
        //if val from db is true set turn switch on else turn off
        if (task.isComplete == true){
            taskCompleted.setOn(true, animated: true)
        }
        else
        {
            taskCompleted.setOn(false, animated: true)
        }

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


