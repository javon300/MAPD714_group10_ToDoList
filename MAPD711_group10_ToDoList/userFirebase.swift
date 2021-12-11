//
//  userFirebase.swift
//  MAPD711_group10_ToDoList

//

import Foundation
import FirebaseFirestore

extension Task {
    static func build(from documents: [QueryDocumentSnapshot]) -> [Task] {
        var users = [Task]()
        for document in documents {
            users.append(Task(name: document["name"] as? String ?? "",
                              
                              isComplete: document["isCompleted"] as? Bool ?? true,
                              notes: document["notes"] as? String ?? "",
                              hasDueDate: document["hasDueDate"] as? Bool ?? false,
                              dueDate: document["dueDate"] as? String ?? ""))
        }
        return users
    }
}
