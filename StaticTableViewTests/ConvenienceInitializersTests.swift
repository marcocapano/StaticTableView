//
//  ConvenienceInitializersTests.swift
//  StaticTableViewTests
//
//  Created by Marco Capano on 10/11/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest

class ConvenienceInitializersTests: XCTestCase {

    func testTextAccessoryView() {
        let text = "my text"
        let view = UIView()
        
        let cell = StaticCell(text: text, accessoryView: view)
        cell.configure(cell)
        
        XCTAssertEqual(text, cell.textLabel?.text)
        XCTAssertEqual(view, cell.accessoryView)
    }
    
    func testTextAccessoryType() {
        let text = "some text"
        let accessoryType = UITableViewCell.AccessoryType.detailButton
        
        let cell = StaticCell(text: text, accessoryType: accessoryType)
        cell.configure(cell)
        
        XCTAssertEqual(cell.textLabel?.text, text)
        XCTAssertEqual(cell.accessoryType, accessoryType)
    }
    
    func testButtonStyleWithTitleAndButtonColor() {
        let title = "title"
        let color = UIColor.green
        
        let cell = StaticCell(buttonTitle: title, buttonColor: color)
        cell.configure(cell)
        
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.textLabel?.textColor, color)
        XCTAssertEqual(cell.textLabel?.textAlignment, NSTextAlignment.natural)
    }
    
    func testButtonStyleWithAlignment() {
        let title = "title"
        let color = UIColor.green
        let alignment = NSTextAlignment.center
        
        let cell = StaticCell(buttonTitle: title, buttonColor: color, alignment: alignment)
        cell.configure(cell)
        
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.textLabel?.textColor, color)
        XCTAssertEqual(cell.textLabel?.textAlignment, alignment)
    }
    
    func testTitleAndSubtitle() {
        let title = "A title"
        let subtitle = "Subtitle"
        
        let cell = StaticCell(title: title, subtitle: subtitle)
        cell.configure(cell)
        
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.detailTextLabel?.text, subtitle)
    }
    
    func testLeftAndRightStyle() {
        let left = "left"
        let right = "right"
        
        let cell = StaticCell(leftText: left, rightText: right)
        cell.configure(cell)
        
        XCTAssertEqual(cell.textLabel?.text, left)
        XCTAssertEqual(cell.detailTextLabel?.text, right)
    }
    
    func testTextAndSwitchStyle() {
        let bool1 = true
        let bool2 = false
        let text = "string"
        
        let trueCell = StaticCell(text: text, switchOn: bool1)
        let falseCell = StaticCell(text: text, switchOn: bool2)
        
        trueCell.configure(trueCell)
        falseCell.configure(falseCell)
        
        XCTAssertEqual(trueCell.textLabel?.text, text)
        XCTAssertEqual(falseCell.textLabel?.text, text)
        
        let trueSwitch = trueCell.accessoryView as? UISwitch
        let falseSwitch = falseCell.accessoryView as? UISwitch
        
        XCTAssertNotNil(trueSwitch)
        XCTAssertNotNil(falseSwitch)
        
        XCTAssertTrue(trueSwitch!.isOn)
        XCTAssertFalse(falseSwitch!.isOn)
    }
}
