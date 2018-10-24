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
            StaticCell(text: "Cell number 1", whenSelected: { (cell, vc) in
                let detail = UIViewController()
                detail.view.backgroundColor = .green
                detail.title = cell.textLabel?.text
                vc.navigationController?.pushViewController(detail, animated: true)
            }),
            StaticCell(text: "Cell number 2", whenSelected: { (cell, vc) in
                let detail = UIViewController()
                detail.view.backgroundColor = .blue
                detail.title = cell.textLabel?.text
                vc.navigationController?.pushViewController(detail, animated: true)
            })
        ])
    ])
        

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

