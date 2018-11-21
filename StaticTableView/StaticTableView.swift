//
//  StaticTableView.swift
//  StaticTableView
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit
import SafariServices

///A TableViewController that displays static cells.
public final class StaticTableViewController: UITableViewController {
    
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
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.cell(for: indexPath)
        guard let handler = cell.whenSelected else { return }
        
        switch handler {
        case let .execute(block):
            //as a context
            //passing the cell itself and the tableViewController (useful for navigation purposes)
            block(cell,self)
            
        case let .open(url):
            //The URL should be opened using a SFSafariViewController or opening the link directly in Safari. Do not use a custom browser.
            let safari = SFSafariViewController(url: url)
            safari.dismissButtonStyle = .close
            self.present(safari, animated: true, completion: nil)
            
        case let .present(viewController):
            self.present(viewController, animated: true, completion: nil)
            
            //Hack to solve bug that makes presenting a controller inside this method slow when
            //the cell's selectionStyle is set to SelectionStyle.none .
            //Dispatching an empty block seems to do the trick, see: https://openradar.appspot.com/19563577
            //Do not put the presentation code inside the dispatched block, it will cause the synchronous tests to fail.
            DispatchQueue.main.async(execute: {})
            
        case let .push(viewController):
            //If the controller is embedded in a UINavigationController, push the passed ViewController, else trap.
            assert(self.navigationController != nil, "Cannot push a UIViewController if there's no UINavigationController")
            self.navigationController?.pushViewController(viewController, animated: true)
        }

    }
}
