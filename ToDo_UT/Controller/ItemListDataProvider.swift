//
//  ItemListDataProvider.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 19/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import Foundation
import UIKit

enum Section : Int {
    case ToDo
    case Done
}

class ItemListDataProvider : NSObject, UITableViewDataSource {
    var itemManager : ItemManager?
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows : Int
        
        guard let itemManager = itemManager else {
            return 0
        }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        switch itemSection {
        case .ToDo:
            numberOfRows = itemManager.toDoCount
        case .Done:
            numberOfRows = itemManager.doneCount
        }
        
        return numberOfRows
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ItemCell()
    }
    
}
