//
//  StaticTableView.swift
//  StaticTableView
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///A TableViewController that displays static cells.
public class StaticTableViewController: UITableViewController {
    
    public var sections: [Section] {
        didSet {
            tableView.reloadData()
        }
    }
    
    public init(title: String = "", sections: [Section]) {
        self.sections = sections
        super.init(style: .grouped)
        self.title = title
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
    
    override public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        ///Configuring the cell as requested and displaying it.
        let cell = self.cell(for: indexPath)
        cell.configure(cell)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///As a context, we pass the cell itself and the tableViewController (useful for navigation purposes)
        let cell = self.cell(for: indexPath)
        cell.didSelect?(cell,self)
    }
}
