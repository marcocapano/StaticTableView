//
//  StaticCell.swift
//  StaticTableView
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

public class StaticCell: UITableViewCell {
    public typealias StaticCellSelectionBlock = (StaticCell, StaticTableViewController) -> ()
    public typealias StaticCellConfigurationBlock = (StaticCell) -> ()
    
    public var didSelect: StaticCellSelectionBlock?
    public var configure: StaticCellConfigurationBlock
    
    public static let systemColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1.0)

    
    public init(style: UITableViewCell.CellStyle = .default, didSelect: StaticCellSelectionBlock? = nil, configure: @escaping StaticCellConfigurationBlock) {
        self.didSelect = didSelect
        self.configure = configure
        super.init(style: style, reuseIdentifier: nil)
        self.selectionStyle = .none
    }
    
    ///Initializes a simple StaticCell with a text label and an optional accessory view.
    public convenience init(text: String, accessoryView: UIView? = nil, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = text
            $0.accessoryView = accessoryView
        }
    }
    
    ///Initializes a simple StaticCell with a text label and an accessory type.
    public convenience init(text: String, accessoryType: UITableViewCell.AccessoryType, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = text
            $0.accessoryType = accessoryType
        }
    }
    
    ///Initializes a simple StaticCell with "button-style label".
    public convenience init(buttonTitle: String, buttonColor: UIColor = systemColor, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = buttonTitle
            $0.textLabel?.textColor = buttonColor
        }
    }
    
    ///Initializes a simple StaticCell with a subtitle style.
    public convenience init(title: String, subtitle: String, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .subtitle, didSelect: whenSelected) {
            $0.textLabel?.text = title
            $0.detailTextLabel?.text = subtitle
        }
    }
    
    ///Initializes a StaticCell with a value1 style.
    public convenience init(leftText: String, rightText: String, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .value1, didSelect: whenSelected) {
            $0.textLabel?.text = leftText
            $0.detailTextLabel?.text = rightText
        }
    }
    
    //Initializes a StaticCell that displays a text and a static UISwitch control.
    public convenience init(text: String, switchOn: Bool, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = text
            
            let control = UISwitch()
            control.isOn = switchOn
            control.isUserInteractionEnabled = false
            $0.accessoryView = control
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
