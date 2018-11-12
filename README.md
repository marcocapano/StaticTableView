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
            StaticCell(text: "Cell number 1"),
            StaticCell(title: "User ID", subtitle: "4F152GS"),
            StaticCell(leftText: "Address", rightText: "Via Roma, 9"),
            StaticCell(text: "Boolean", switchOn: true),
            StaticCell(text: "Check", accessoryType: .checkmark)
        ])
    ])

```

and here is the result:

<img src="/screenshots/example.gif" width="250">

### WARNING:
New kinds of cells have been added and the example & the gif need an update, have a look to Test.playground to try every kind of cell. 

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
