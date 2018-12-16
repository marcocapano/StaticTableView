import UIKit
import PlaygroundSupport
import StaticTableView

class ProfileViewController: UIViewController {
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        title = name
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("who uses storyboard")
    }
}

class AddContactViewController: UIViewController {
    
    override func viewDidLoad() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Modal presentation"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        view.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}

let profile = ProfileViewController(name: "marcocapano")
let add = AddContactViewController()
let twitterURL = URL(string: "https://www.twitter.com/marcocapano1")!

let staticTableView = StaticTableViewController(
    title: "Static TableView", sections: [
        Section(headerTitle: "Created by:", cells: [
            StaticCell(text: "marcocapano", accessoryView: UIButton(type: .contactAdd), whenSelected: .push(profile))
            ]),
        Section(headerTitle: "Details:", footerTitle: "Nice footer", cells: [
            StaticCell(text: "Twitter @marcocapano1", whenSelected: .open(twitterURL)),
            StaticCell(title: "Birth date", subtitle: "03/11/1997"),
            StaticCell(leftText: "Title", rightText: "iOS Developer"),
            StaticCell(text: "Curious", switchOn: true),
            StaticCell(text: "Cool README", accessoryType: .checkmark),
            StaticCell(buttonTitle: "Add contact", whenSelected: .present(add)),
            StaticCell(buttonTitle: "Block user", buttonColor: .red, alignment: .center),
            StaticCell(minimumValue: 0, maximumValue: 1, sliderValue: 0.5)
            ])
    ])

PlaygroundPage.current.liveView =  UINavigationController(rootViewController: staticTableView)

staticTableView.view.tintColor = .yellow
staticTableView.sections.forEach({$0.cells.forEach({$0.tintColor = .yellow})})

Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in staticTableView.tableView.reloadData() })
