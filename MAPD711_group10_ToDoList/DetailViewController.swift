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

class DetailViewController: UIViewController
{
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var notesTF: UITextField!
    @IBOutlet weak var hasDueDateSwitch: UISwitch!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var isCompleteSwitch: UISwitch!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    var docRef: DocumentReference!
    
    @IBAction func update(_ sender: UIButton)
    {
        guard let name = nameTF.text, !name.isEmpty else {return}
        guard let notes = notesTF.text, !notes.isEmpty else {return}
        let dueDate = "12/12/2022"
        let hasDueDate = hasDueDateSwitch.isOn
        let isComplete = isCompleteSwitch.isOn
        let dataToSave: [String: Any] = ["name": name, "isComplete": isComplete, "notes": notes, "hasDueDate": hasDueDate, "dueDate":  dueDate]

//        let dataToSave: [String: Any] = ["name": name,  "notes": notes]//,  "dueDate":  dueDate]
            docRef.setData(dataToSave) { (error) in
            if let error = error {
                print("Oh no, Got an error: \(error.localizedDescription)")
            }
            else{
                print("Data has been saved")
            }
        }
    }
    //for navigation with segue
    var taskString = String()
  
    
    
}
