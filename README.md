# StaticTableView

A simple and declarative way of creating a static TableViewController.

Creating a TableViewController is just as easy as:

``` swift
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
- Add more SelectionHandler cases for common use cases.
- Adding more convenience initializers for common types of cells.
- Add StaticCell subclasses to make more complex cells.
- Support a custom UIView as a section header/footer.

# Creating cells
You can create cells with **7 different styles**:

``` swift
let textAndViewCell = StaticCell(text: "marcocapano", accessoryView: UIButton(type: .contactAdd))
let textCell = StaticCell(text: "Twitter @marcocapano1")
let titleAndSubtitleCell = StaticCell(title: "Birth date", subtitle: "03/11/1997")
let leftAndRightTextCell = StaticCell(leftText: "Title", rightText: "iOS Developer")
let textAndSwitchCell = StaticCell(text: "Curious", switchOn: true)
let textAndAccessoryCell = StaticCell(text: "Cool README", accessoryType: .checkmark)
let systemButtonStyleCell = StaticCell(buttonTitle: "Add contact", buttonColor: .red)

```
And in each of these initializers you can set a `SelectionHandler` of your choice between:

``` swift
public enum SelectionHandler {
    //Executes the given block
    case execute(StaticCellSelectionBlock)
    //Opens the URL in a native SFSafariViewController
    case open(URL)
    //Presents a ViewController modally on top of the tableView.
    case present(UIViewController)
    //Pushes the given ViewController on the navigation stack.
    case push(UIViewController)
}

```



