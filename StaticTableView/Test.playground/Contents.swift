import UIKit
import PlaygroundSupport
import StaticTableView

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(text: "marcocapano", accessoryView: UIButton(type: .contactAdd), whenSelected: { (cell, vc) in
                let detail = UIViewController()
                detail.view.backgroundColor = .yellow
                detail.title = cell.textLabel?.text
                vc.navigationController?.pushViewController(detail, animated: true)
            })
        ]),
        Section(headerTitle: "Details:", footerTitle: "Nice footer", cells: [
            StaticCell(text: "Cell number 1"),
            StaticCell(title: "User ID", subtitle: "4F152GS"),
            StaticCell(leftText: "Address", rightText: "Via Roma, 9"),
            StaticCell(text: "Boolean", switchOn: true),
            StaticCell(text: "Check", accessoryType: .checkmark)
        ])
    ])

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

