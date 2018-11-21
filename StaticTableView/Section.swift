//
//  Section.swift
//  StaticTableView
//
//  Created by Marco Capano on 24/10/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///A StaticTableViewController section.
public final class Section {
    public var cells: [StaticCell]
    public var headerTitle: String?
    public var footerTitle: String?
    
    public init(headerTitle: String? = nil, footerTitle: String? = nil, cells: [StaticCell]) {
        self.cells = cells
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}
