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

    func testEmptyTableView() {
        let staticTableView = StaticTableViewController(sections: [])
        
        XCTAssertEqual(staticTableView.sections.count, 0)
    }
    
    func testTitle() {
        let title = "Title"
        let staticTableView = StaticTableViewController(title: title, sections: [])
        
        XCTAssertEqual(title, staticTableView.title)
    }
    
    func testSectionsHeaderAndFooterTitles() {
        let header = "HEADER"
        let footer = "FOOTER"
        
        let section = Section(headerTitle: header, footerTitle: footer, cells: [])
        XCTAssertEqual(section.headerTitle, header)
        XCTAssertEqual(section.footerTitle, footer)
    }
    
    func testConfigurationBlock() {
        let text = "Teeeext"
        let color = UIColor.green
        
        
        //When cell is configured
        let cell = StaticCell(style: .default) {
            $0.textLabel?.text = text
            $0.backgroundColor = color
        }
        
        cell.configure(cell)
        
        //Test attributes
        XCTAssertNotNil(cell.configure)
        XCTAssertEqual(cell.textLabel?.text, text)
        XCTAssertEqual(cell.backgroundColor, color)
    }
    
    func testSelectionBlock() {
        let selection = expectation(description: "Waiting for cell selection")
        
        let vc = StaticTableViewController(sections: [])
        
        let cell = StaticCell(selectionHandler: StaticCell.SelectionHandler.execute({ (_, _) in
            selection.fulfill()
        }), configure: { _ in })
        
        XCTAssertNotNil(cell.selectionHandler)
        cell.didSelect!(cell,vc)
        
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNil(error)
        }
        
    }
}
