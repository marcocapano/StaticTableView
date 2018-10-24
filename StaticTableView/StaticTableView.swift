//
//  StaticTableView.swift
//  StaticTableView
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

public typealias StaticCellSelectionBlock = (StaticCell, StaticTableViewController) -> ()
public typealias StaticCellConfigurationBlock = (StaticCell) -> ()

public class StaticCell: UITableViewCell {
    public var didSelect: StaticCellSelectionBlock?
    public var configure: StaticCellConfigurationBlock
    
    public init(style: UITableViewCell.CellStyle = .default, didSelect: StaticCellSelectionBlock? = nil, configure: @escaping StaticCellConfigurationBlock) {
        self.didSelect = didSelect
        self.configure = configure
        super.init(style: style, reuseIdentifier: nil)
    }
    
    public convenience init(text: String, accessoryView: UIView? = nil, whenSelected: StaticCellSelectionBlock? = nil) {
        self.init(style: .default, didSelect: whenSelected) {
            $0.textLabel?.text = text
            $0.accessoryView = accessoryView
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class Section {
    public var cells: [StaticCell]
    public var headerTitle: String?
    public var footerTitle: String?
    
    public init(headerTitle: String? = nil, footerTitle: String? = nil, cells: [StaticCell]) {
        self.cells = cells
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}

public class StaticTableViewController: UITableViewController {
    
    public var sections: [Section] {
        didSet {
            tableView.reloadData()
        }
    }
    
    public init(title: String = "", sections: [Section]) {
        self.sections = sections
        super.init(style: .grouped)
        navigationItem.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cell(for indexPath: IndexPath) -> StaticCell {
        return sections[indexPath.section].cells[indexPath.row]
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    override public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }
    
    public override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cell(for: indexPath)
        cell.configure(cell)
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.cell(for: indexPath)
        cell.didSelect?(cell,self)
    }
}
