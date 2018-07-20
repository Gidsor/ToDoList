//
//  Model.swift
//  ToDoList
//
//  Created by Vadim Denisov on 19.07.2018.
//  Copyright © 2018 Vadim Denisov. All rights reserved.
//

import Foundation

var ToDoItems: [String] = ["Тестовая заметка №1", "Дело №2"]

func addItem(nameItem: String) {
    ToDoItems.append(nameItem)
    saveData()
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    saveData()
}

func saveData() {
    
}

func loadData() {
    
}
