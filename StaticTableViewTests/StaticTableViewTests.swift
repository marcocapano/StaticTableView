//
//  StaticTableViewTests.swift
//  StaticTableViewTests
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest
@testable import StaticTableView

class StaticTableViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyTableView() {
        let staticTableView = StaticTableViewController(sections: [])
        
        XCTAssertEqual(staticTableView.sections.count, 0)
    }
    
    func testTitle() {
        let title = "Title"
        let staticTableView = StaticTableViewController(title: title, sections: [])
        
        XCTAssertEqual(title, staticTableView.title)
    }
    
    func testSectionsHeaderAndFooters() {
        let header = "HEADER"
        let footer = "FOOTER"
        
        let section = Section(headerTitle: header, footerTitle: footer, cells: [])
        XCTAssertEqual(section.headerTitle, header)
        XCTAssertEqual(section.footerTitle, footer)
    }
    
    func testDefaultCellInit() {
        let style = UITableViewCell.CellStyle.value1
        let text = "Teeeext"
        let color = UIColor.green

        let cell = StaticCell(style: .default) {
            $0.textLabel?.text = text
            $0.backgroundColor = color
        }
        
        XCTAssertEqual(cell.textLabel?.text, text)
        XCTAssertEqual(cell.backgroundColor, color)
    }
    
    func testTextCell() {
        let text = "my text"
        let cell = StaticCell(text: text)
        
        XCTAssertEqual(text, cell.textLabel?.text)
    }
    
    func testAccessoryViewCell() {
        let view = UIView()
        
        let cell = StaticCell(text: "some text", accessoryView: view)
        
        XCTAssertEqual(cell.accessoryView, view)
    }
}
