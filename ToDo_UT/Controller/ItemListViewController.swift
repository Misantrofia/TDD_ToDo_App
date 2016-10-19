//
//  ItemListViewController.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 19/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import Foundation
import  UIKit

class ItemListViewController : UIViewController {
    @IBOutlet var tableView : UITableView!
    @IBOutlet var dataProvider: UITableViewDataSource & UITableViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.dataSource = dataProvider
        self.tableView?.delegate = dataProvider
    }
}
