import UIKit
import PlaygroundSupport
import StaticTableView

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(configure: {
                $0.textLabel?.text = "marcocapano"
            })
        ]),
        Section(headerTitle: "Some other cells:", footerTitle: "Nice footer", cells: [
            StaticCell(configure: {
                $0.textLabel?.text = "Cell number 1"
            }),
            StaticCell(configure: {
                $0.textLabel?.text = "Cell number 2"
            })
        ]),
    ])

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

