# StaticTableView

A simple and declarative way of creating a static TableViewController.

Creating a TableViewController is just as easy as:

``` swift
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
                        let url = URL(string: "https://www.twitter.com/marcocapano1")!
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

```

and here is the result:

<img src="/screenshots/example.gif" width="250">

## Installation
Just drag the StaticTableView.swift, Section.swift and StaticCell.swift files into your project.

## Things you can do now
- Creating multiple sections with a header and a footer.
- Creating multiple cell for each section.
- Configure your cells with the `configure` method.
- Use already made cell styles.
- React to cell selection.

## Future plans:
- Adding more convenience initializers for common types of cells.
- Add StaticCell subclasses to make more complex cells.
- Support a custom UIView as a section header/footer.
- Make it easier and less verbose to execute simple tasks when a cell is selected(presenting a view controller, opening a link etc..)
