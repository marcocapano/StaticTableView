# StaticTableView

A simple and declarative way of creating a static TableViewController.

Creating a TableViewController is just as easy as:

``` swift
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

```

and here is the result:

<img src="/screenshots/example.gif" width="250">

## Installation
Just drag the StaticTableView.swift, Section.swift and StaticCell.swift files into your project.

## Things you can do now
- Creating multiple sections with a header.
- Creating multiple cell for each section.
- Configure your cells with the `configure` method.
- React to cell selection.

## Future plans:
- Adding convenience initializers for common types of cells.
