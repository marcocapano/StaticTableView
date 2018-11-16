import UIKit
import PlaygroundSupport
import StaticTableView

let profile = UIViewController()
profile.view.backgroundColor = .yellow
profile.title = "marcocapano"

let add = UIViewController()
add.title = "Add contact"
add.view.backgroundColor = .blue

let url = URL(string: "https://www.twitter.com/marcocapano1")!

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(text: "marcocapano", accessoryView: UIButton(type: .contactAdd), whenSelected: .push(profile))
        ]),
        Section(headerTitle: "Details:", footerTitle: "Nice footer", cells: [
            StaticCell(text: "Twitter @marcocapano1", whenSelected: .open(url)),
            StaticCell(title: "Birth date", subtitle: "03/11/1997"),
            StaticCell(leftText: "Title", rightText: "iOS Developer"),
            StaticCell(text: "Curious", switchOn: true),
            StaticCell(text: "Cool README", accessoryType: .checkmark),
            StaticCell(buttonTitle: "Add contact", whenSelected: .present(add)),
            StaticCell(buttonTitle: "Block user", buttonColor: .red)
        ])
    ])

PlaygroundPage.current.liveView =  UINavigationController(rootViewController: staticTableView)

