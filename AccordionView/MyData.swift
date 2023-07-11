//
//  MyData.swift
//  AccordionView
//
//  Created by Ideas2IT on 24/05/23.
//

import Foundation

class MyData {
    let title: String
    var options: [String]
    var isExpanded: Bool = false
    var selectedOption: String
    
    init(title: String, options: [String], isExpanded: Bool = false, selectedOption: String) {
        self.title = title
        self.options = options
        self.isExpanded = isExpanded
        self.selectedOption = selectedOption
    }
}
