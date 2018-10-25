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
    
    public init(style: UITableViewCell.CellStyle = .default, didSelect: StaticCellSelectionBlock? = nil, configure: @escaping StaticCellConfigurationBlock) {
        self.didSelect = didSelect
        self.configure = configure
        super.init(style: style, reuseIdentifier: nil)
    }
    
    ///Initializes a simple UITableViewCell with a text label and an optional accessory view.
    public convenience init(text: String, accessoryView: UIView? = nil, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = text
            $0.accessoryView = accessoryView
        }
    }
    
    ///Initializes a simple UITableViewCell with a subtitle style.
    public convenience init(title: String, subtitle: String, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .subtitle, didSelect: whenSelected) {
            $0.textLabel?.text = title
            $0.detailTextLabel?.text = subtitle
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
