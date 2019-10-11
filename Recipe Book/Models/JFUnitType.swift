//
//  JFUnitType.swift
//  Recipe Book
//
//  Created by Jonas Frey on 25.03.19.
//  Copyright © 2019 Jonas Frey. All rights reserved.
//

import Foundation

enum JFUnitType: String, CaseIterable, Codable, Equatable, Hashable {
    case none
    case piece
    case kilogram
    case gram
    case liter
    case milliliter
    case tablespoon
    case teaspoon
    case stem
    // Packung
    case box
    // Tasse
    case cup
    case pinch
    case dice
    case leaf
    case jar
    
    var humanReadable: (singular: String, plural: String) {
        switch self {
        case .none:
            return (JFLiterals.noUnit, JFLiterals.noUnit)
        case .piece:
            return ("piece", "pieces")
        case .kilogram:
            return ("kg", "kg")
        case .gram:
            return ("g", "g")
        case .liter:
            return ("l", "l")
        case .milliliter:
            return ("ml", "ml")
        case .tablespoon:
            return ("tablespoon", "tablespoons")
        case .teaspoon:
            return ("teaspoon", "teaspoons")
        case .stem:
            return ("stem", "stems")
        case .box:
            return ("box", "boxes")
        case .cup:
            return ("cup", "cups")
        case .pinch:
            return ("pinch", "pinches")
        case .dice:
            return ("dice", "dices")
        case .leaf:
            return ("leaf", "leaves")
        case .jar:
            return ("jar", "jars")
        }
    }
    
    func humanReadable(_ amount: Int) -> String {
        return amount == 1 ? self.humanReadable.singular : self.humanReadable.plural
    }
}
