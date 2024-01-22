//
//  Merchant.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/22/24.
//

import Foundation
import SwiftUI

struct Merchant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var isExpanded: Bool = false
    var tag: Tag
}

enum Tag: String, Codable, CaseIterable {
    case none = "None"
    case groceries = "Groceries"
    case homegoods = "Homegoods"
    
    var isEmpty: Bool {
        self == .none ? true : false
    }
    
    var color: Color {
        switch self {
        case .none:
            return Color.gray
        case .groceries:
            return Color.green
        case .homegoods:
            return Color.red
        }
    }
}
