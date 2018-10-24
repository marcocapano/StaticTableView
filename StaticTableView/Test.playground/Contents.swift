import UIKit
import PlaygroundSupport
import StaticTableView

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(text: "marcocapano")
        ]),
        Section(headerTitle: "Some other cells:", footerTitle: "Nice footer", cells: [
            StaticCell(text: "Cell number 1"),
            StaticCell(text: "Cell number 2")
        ])
    ])

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

