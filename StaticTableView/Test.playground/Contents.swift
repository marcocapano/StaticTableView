import UIKit
import PlaygroundSupport
import StaticTableView

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(text: "marcocapano", whenSelected: { (cell, vc) in
                let detail = UIViewController()
                detail.view.backgroundColor = .yellow
                detail.title = cell.textLabel?.text
                vc.navigationController?.pushViewController(detail, animated: true)
            })
        ]),
        Section(headerTitle: "Some other cells:", footerTitle: "Nice footer", cells: [
            StaticCell(text: "Cell number 1"),
            StaticCell(title: "User ID", subtitle: "4F152GS"),
            StaticCell(leftText: "Address", rightText: "Via Roma, 9")
        ])
    ])

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

