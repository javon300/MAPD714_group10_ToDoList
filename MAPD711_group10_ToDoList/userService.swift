//
//  userService.swift
//  MAPD711_group10_ToDoList

//

import Foundation
import FirebaseFirestore

class UserService {
    let database = Firestore.firestore()

    func get(collectionID: String, handler: @escaping ([Task]) -> Void) {
        database.collection("taskList")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(Task.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    
    func delete(){
        database.collection("taskList").document("SJIf1KOMqpKLTyOekZFB").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
    }
}
