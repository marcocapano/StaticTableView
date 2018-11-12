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
            StaticCell(text: "Twitter @marcocapano1", whenSelected: { (_, vc) in
                let url = URL(string: "www.twitter.com/marcocapano1")!
                UIApplication.shared.open(url, options: [:])
            }),
            StaticCell(title: "Birth date", subtitle: "03/11/1997"),
            StaticCell(leftText: "Title", rightText: "iOS Developer"),
            StaticCell(text: "Curious", switchOn: true),
            StaticCell(text: "Cool README", accessoryType: .checkmark),
            StaticCell(buttonTitle: "Add contact"),
            StaticCell(buttonTitle: "Block user", buttonColor: .red)
        ])
    ])

PlaygroundPage.current.liveView = UINavigationController(rootViewController: staticTableView)

