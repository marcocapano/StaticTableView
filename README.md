# StaticTableView

A simple and declarative way of creating a static TableViewController.

Creating a TableViewController is just as easy as:

``` swift
let staticTableView = StaticTableViewController(sections: [
    Section(cells: [
        StaticCell(configure: {
            $0.textLabel?.text = "marcocapano"
        })
        ], headerTitle: "Created by:"),
    Section(cells: [
        StaticCell(configure: {
            $0.textLabel?.text = "Cell number 1"
        }),
        StaticCell(configure: {
            $0.textLabel?.text = "Cell number 2"
        })
        ], headerTitle: "Some other cells:"),
    ]
    , title: "Static TableView")

```

and here is the result:

<img src="/screenshots/example.png" width="250">

## Installation
Just drag the StaticTableView.swift file into your project.

## Things you can do now
- Creating multiple sections with a header.
- Creating multiple cell for each section.
- Configure your cells with the `configure` method.

## Future plans:
- Adding section footer support.
- Adding didSelectCell support.
- Adding convenience initializers for common types of cells.
