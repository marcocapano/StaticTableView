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
        //Given
        let text = "my text"
        let view = UIView()
        
        //When
        let cell = StaticCell(text: text, accessoryView: view)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(text, cell.textLabel?.text)
        XCTAssertEqual(view, cell.accessoryView)
    }
    
    func testTextAccessoryType() {
        //Given
        let text = "some text"
        let accessoryType = UITableViewCell.AccessoryType.detailButton
        
        //When
        let cell = StaticCell(text: text, accessoryType: accessoryType)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(cell.textLabel?.text, text)
        XCTAssertEqual(cell.accessoryType, accessoryType)
    }
    
    func testButtonStyleWithTitleAndButtonColor() {
        //Given
        let title = "title"
        let color = UIColor.green
        
        //When
        let cell = StaticCell(buttonTitle: title, buttonColor: color)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.textLabel?.textColor, color)
        XCTAssertEqual(cell.textLabel?.textAlignment, NSTextAlignment.natural)
    }
    
    func testButtonStyleWithAlignment() {
        //Given
        let title = "title"
        let color = UIColor.green
        let alignment = NSTextAlignment.center
        
        //When
        let cell = StaticCell(buttonTitle: title, buttonColor: color, alignment: alignment)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.textLabel?.textColor, color)
        XCTAssertEqual(cell.textLabel?.textAlignment, alignment)
    }
    
    func testTitleAndSubtitle() {
        //Given
        let title = "A title"
        let subtitle = "Subtitle"
        
        //When
        let cell = StaticCell(title: title, subtitle: subtitle)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(cell.textLabel?.text, title)
        XCTAssertEqual(cell.detailTextLabel?.text, subtitle)
    }
    
    func testLeftAndRightStyle() {
        //Given
        let left = "left"
        let right = "right"
        
        //When
        let cell = StaticCell(leftText: left, rightText: right)
        cell.configure(cell)
        
        //Test
        XCTAssertEqual(cell.textLabel?.text, left)
        XCTAssertEqual(cell.detailTextLabel?.text, right)
    }
    
    func testTextAndSwitchStyle() {
        //Given
        let bool1 = true
        let bool2 = false
        let text = "string"
        
        //When
        let trueCell = StaticCell(text: text, switchOn: bool1)
        let falseCell = StaticCell(text: text, switchOn: bool2)
        
        trueCell.configure(trueCell)
        falseCell.configure(falseCell)
        
        //Test
        XCTAssertEqual(trueCell.textLabel?.text, text)
        XCTAssertEqual(falseCell.textLabel?.text, text)
        
        let trueSwitch = trueCell.accessoryView as? UISwitch
        let falseSwitch = falseCell.accessoryView as? UISwitch
        
        XCTAssertNotNil(trueSwitch)
        XCTAssertNotNil(falseSwitch)
        
        XCTAssertTrue(trueSwitch!.isOn)
        XCTAssertFalse(falseSwitch!.isOn)
    }
    
    func testSwitchTint() {
        let text = "string"
        
        //We want to test that the default init uses the cell tint color as an onTintColor for the switch.
        //While the init with the "switchOnColor" parameter should use the passed parameter.
        let defaultTintCell = StaticCell(text: text, switchOn: true)
        let customTintCell = StaticCell(text: text, switchOn: true, switchOnColor: .yellow)
        
        defaultTintCell.tintColor = .red
        customTintCell.tintColor = .red
        
        defaultTintCell.configure(defaultTintCell)
        customTintCell.configure(customTintCell)
        
        XCTAssertEqual(defaultTintCell.textLabel?.text, text)
        XCTAssertEqual(customTintCell.textLabel?.text, text)
        
        let defaultSwitch = defaultTintCell.accessoryView as? UISwitch
        let customSwitch = customTintCell.accessoryView as? UISwitch
        
        XCTAssertNotNil(defaultSwitch)
        XCTAssertNotNil(customSwitch)
        
        XCTAssertTrue(defaultSwitch!.isOn)
        XCTAssertTrue(customSwitch!.isOn)
        
        XCTAssertEqual(defaultSwitch!.onTintColor, .red)
        XCTAssertEqual(customSwitch!.onTintColor, .yellow)
    }
}
