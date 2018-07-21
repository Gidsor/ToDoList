//
//  Model.swift
//  ToDoList
//
//  Created by Vadim Denisov on 19.07.2018.
//  Copyright © 2018 Vadim Denisov. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get {
        
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
    setBadge()
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    setBadge()
}

func moveItem(from: Int, to: Int) {
    let fromItem = ToDoItems[from]
    ToDoItems.remove(at: from)
    ToDoItems.insert(fromItem, at: to)
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    saveData()
    setBadge()
    return ToDoItems[item]["isCompleted"] as! Bool
}

func saveData() {
}

func loadData() {
}

func requestForNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { (isEnabled, error) in

    }
}

func setBadge() {
    var countUncheck = 0
    for item in ToDoItems {
        if (item["isCompleted"] as? Bool) == false {
            countUncheck = countUncheck + 1
        }
    }
    UIApplication.shared.applicationIconBadgeNumber = countUncheck
}
