//
//  ItemManager.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 18/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import Foundation

class ItemManager {
    private var toDoItems =  [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    var toDoCount : Int { return toDoItems.count }
    var doneCount : Int { return doneItems.count }

    func addItem(item: ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
    }
    
    func itemAtIndex(index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func doneItemAtIndex(index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func checkItemAtIndex(index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func removeAllItems() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
