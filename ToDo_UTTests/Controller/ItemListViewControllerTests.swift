//
//  ItemListViewControllerTests.swift
//  ToDo_UT
//
//  Created by Alexandru Schwartz on 19/10/16.
//  Copyright © 2016 Alexandru Schwartz. All rights reserved.
//

import XCTest
@testable import ToDo_UT

class ItemListViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_tableViewIsNotNilAfterViewDidLoad() {
        let sut = ItemListViewController()
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView)
    }
}
