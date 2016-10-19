//
//  ToDoItemTests.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 18/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import XCTest
@testable import ToDo_UT

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit_ShouldSetTitle() {
        let item = ToDoItem(title: "Test title")
        XCTAssertEqual(item.title, "Test title",
                       "Initializer should set the item title")
    }
    
    func testInit_ShouldSetTitleAndDescription() {
        let item = ToDoItem(title: "Test title", itemDescription: "Test Description")
        XCTAssertEqual(item.itemDescription, "Test Description",
                       "Initializer should set the item description")
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimestamp() {
        let item = ToDoItem(title: "Test title", itemDescription: "Test description",
                            timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "Initializer should set the timestamp")
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimestampAndLocation() {
        let location = Location(name: "Test name")
        let item = ToDoItem(title: "Test title", itemDescription: "Test description", timestamp: 0.0, location: location)
        XCTAssertEqual(item.location?.name, location.name, "Initializer should set the location")
    }
    
    func testEqualItems_ShouldBeEqual() {
        let firstItem = ToDoItem(title: "First item")
        let secondItem = ToDoItem(title: "First item")
        XCTAssertEqual(firstItem, secondItem)
    }
    
    func testWhenLocationDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First item",
                                 itemDescription: "This is the first item",
                                 timestamp: 0.0,
                                 location: Location(name: "Home"))
        let secondItem = ToDoItem(title: "Second item",
                                  itemDescription: "This is the second item",
                                  timestamp: 0.0,
                                  location: Location(name: "Office"))
        XCTAssertNotEqual(firstItem, secondItem, "the items should not be equal")
    }
    
    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        var firstItem = ToDoItem(title: "First item",
                                 itemDescription: "This is the first item",
                                 timestamp: 0.0,
                                 location: nil)
        var secondItem = ToDoItem(title: "Second item",
                                  itemDescription: "This is the second item",
                                  timestamp: 0.0,
                                  location: Location(name: "Office"))
        XCTAssertNotEqual(firstItem, secondItem, "the items should not be equal")
        
        firstItem = ToDoItem(title: "First title",
                             itemDescription: "First description",
                             timestamp: 0.0,
                             location: Location(name: "Home"))
        secondItem = ToDoItem(title: "First title",
                              itemDescription: "First description",
                              timestamp: 0.0,
                              location: nil)
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenTimestampDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First Description",
                                 timestamp: 1.0)
        let secondItem = ToDoItem(title: "First title",
                                 itemDescription: "First Description",
                                 timestamp: 0.0)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenDescriptionDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First description")
        let secondItem = ToDoItem(title: "First title",
                                  itemDescription: "Second description")
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenTitleDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title")
        let secondItem = ToDoItem(title: "Second title")
        XCTAssertNotEqual(firstItem, secondItem)
    }
}
