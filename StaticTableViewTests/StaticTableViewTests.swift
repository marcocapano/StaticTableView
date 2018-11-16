//
//  StaticTableViewTests.swift
//  StaticTableViewTests
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest
import SafariServices
@testable import StaticTableView

class StaticTableViewTests: XCTestCase {

    func testEmptyTableView() {
        //Given
        let staticTableView = StaticTableViewController(sections: [])
        //Test
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
        //Given
        let text = "Teeeext"
        let color = UIColor.green
        
        
        //When
        let cell = StaticCell(style: .default) {
            $0.textLabel?.text = text
            $0.backgroundColor = color
        }
        
        cell.configure(cell)
        
        //Test
        XCTAssertNotNil(cell.configure)
        XCTAssertEqual(cell.textLabel?.text, text)
        XCTAssertEqual(cell.backgroundColor, color)
    }
    
    func testSelectionBlock() {
        let selection = expectation(description: "Waiting for cell selection")
        
        //Given
        let cell = StaticCell(whenSelected: .execute({ (_, _) in
            selection.fulfill()
        }), configure: { _ in })
        
        let vc = StaticTableViewController(sections: [Section(cells: [cell])])
        
        //When
        vc.tableView(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //Test
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNil(error)
            XCTAssertNotNil(cell.whenSelected)
        }
    }
    
    func testSelectionPresentVC() {
        //Given
        let presentedVC = UIViewController()
        let cell = StaticCell(whenSelected: .present(presentedVC), configure: { _ in })
        let tableViewController = StaticTableViewController(sections: [Section(cells: [cell])])
        
        let window = UIWindow()
        window.rootViewController = tableViewController
        window.addSubview(tableViewController.view)
        RunLoop.current.run(until: Date())
        
        //When
        tableViewController.tableView(tableViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //Test
        XCTAssertNotNil(cell.whenSelected)
        XCTAssertEqual(tableViewController.presentedViewController, presentedVC)
        XCTAssertEqual(presentedVC.presentingViewController, tableViewController)
    }
    
    func testSelectionPushVC() {
        //Given
        let pushedVC = UIViewController()
        let cell = StaticCell(whenSelected: .push(pushedVC), configure: { _ in })
        let tableViewController = StaticTableViewController(sections: [Section(cells: [cell])])
        let nav = UINavigationController(rootViewController: tableViewController)
        
        let window = UIWindow()
        window.rootViewController = nav
        window.addSubview(nav.view)
        RunLoop.current.run(until: Date())
        
        //When
        tableViewController.tableView(tableViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //Test
        XCTAssertNotNil(cell.whenSelected)
        XCTAssertEqual(nav.viewControllers.count, 2)
        XCTAssertEqual(nav.visibleViewController, pushedVC)
    }
    
    func testSelectionOpenURL() {
        //Given
        let url = URL(string: "https://www.apple.com")!
        let cell = StaticCell(whenSelected: .open(url), configure: { _ in })
        let tableViewController = StaticTableViewController(sections: [Section(cells: [cell])])
        
        let window = UIWindow()
        window.rootViewController = tableViewController
        window.addSubview(tableViewController.view)
        RunLoop.current.run(until: Date())
        
        //When
        tableViewController.tableView(tableViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //Test
        XCTAssertNotNil(cell.whenSelected)
        let visibleVC = tableViewController.presentedViewController as? SFSafariViewController
        XCTAssertNotNil(visibleVC)
    }
}
