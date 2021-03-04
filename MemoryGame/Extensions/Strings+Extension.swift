//
//  Strings+Extension.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 28/02/21.
//


import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

