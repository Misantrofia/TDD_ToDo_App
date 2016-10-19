//
//  ItemListDataProviderTests.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 19/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import XCTest
@testable import ToDo_UT

class ItemListDataProviderTests: XCTestCase {
    var sut : ItemListDataProvider!
    var tableView : UITableView!
    
    override func setUp() {
        super.setUp()
        
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        tableView = UITableView()
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberRowsInFirstSection_IsToDoCount() {
        tableView.dataSource = sut

        sut.itemManager?.addItem(item: ToDoItem(title: "First item"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.addItem(item: ToDoItem(title: "Second item"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberRowsInSecondSection_IsDoneCount() {
        sut.itemManager?.addItem(item: ToDoItem(title: "First Item"))
        sut.itemManager?.addItem(item: ToDoItem(title: "Second Item"))
        sut.itemManager?.checkItemAtIndex(index: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.itemManager?.checkItemAtIndex(index: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRow_ReturnsItemCell() {
        sut.itemManager?.addItem(item: ToDoItem(title: "First"))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
}
