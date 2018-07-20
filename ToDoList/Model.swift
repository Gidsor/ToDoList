//
//  Model.swift
//  ToDoList
//
//  Created by Vadim Denisov on 19.07.2018.
//  Copyright © 2018 Vadim Denisov. All rights reserved.
//

import Foundation

var ToDoItems: [[String: Any]] = []

func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
    saveData()
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    saveData()
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    saveData()
    return ToDoItems[item]["isCompleted"] as! Bool
}

func saveData() {
    
}

func loadData() {
    
}
