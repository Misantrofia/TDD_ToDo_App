//
//  ItemManagerTests.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 18/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import XCTest
@testable import ToDo_UT

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        self.sut = ItemManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0, "Initially toDo count should be 0")
    }
    
     func testDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.doneCount, 0, "Initially done count should be 0")
    }
    
    func testToDoCount_AfterAddingOneItem_IsOne() {
        let item = ToDoItem(title: "Test item")
        sut.addItem(item: item)
        XCTAssertEqual(sut.toDoCount, 1, "toDo count should be 1")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = ToDoItem(title: "Test item")
        sut.addItem(item: item)
        let returnedItem = sut.itemAtIndex(index: 0)
        XCTAssertEqual(item.title, returnedItem.title , "should be te same item")
    }
    
    func testCheckingItem_ChangesCountOfToDoItemsAndOfDoneItems() {
        let item = ToDoItem(title: "Test Item")
        sut.addItem(item: item)
        sut.checkItemAtIndex(index: 0)
        XCTAssertEqual(sut.toDoCount, 0, "toDo count should be 0")
        XCTAssertEqual(sut.doneCount, 1, "done count should be 1")
    }
    
    func testCheckingItem_RemoveItFromTheToDoList() {
        let firstItem = ToDoItem(title: "First Item")
        let secondItem = ToDoItem(title: "Second item")
        
        sut.addItem(item: firstItem)
        sut.addItem(item: secondItem)
        
        sut.checkItemAtIndex(index: 0)
        
        XCTAssertEqual(sut.itemAtIndex(index: 0).title, secondItem.title, "")
    }
    
    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let item = ToDoItem(title: "Test item")
        sut.addItem(item: item)
        sut.checkItemAtIndex(index: 0)
        
        let returnedItem = sut.doneItemAtIndex(index: 0)
        
        XCTAssertEqual(returnedItem.title, item.title, "should be the same item")
    }
    
    func testRemoveAllItems_ShouldResultInCountsBeZero() {
        sut.addItem(item: ToDoItem(title: "First Item"))
        sut.addItem(item: ToDoItem(title: "Second Item"))
        sut.checkItemAtIndex(index: 0)
        
        XCTAssertEqual(sut.toDoCount, 1, "toDoCount should be 1")
        XCTAssertEqual(sut.doneCount, 1, "doneCount should be 1")
        
        sut.removeAllItems()
        
        XCTAssertEqual(sut.toDoCount, 0, "toDoCount should be 0")
        XCTAssertEqual(sut.doneCount, 0, "doneCount should be 0")
    }
    
    func testAddingTheSameItem_DoesNotIncreaseCount() {
        sut.addItem(item: ToDoItem(title: "First Item"))
        sut.addItem(item: ToDoItem(title: "First Item"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}

