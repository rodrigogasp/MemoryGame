//
//  Font+Extension.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 27/02/21.
//

import UIKit

enum FontType : CaseIterable {
    case regular
    case bold
    case medium
    case italic
    case light
    
}

extension UIFont {
    
    static var fontName = ""
    
    static var mediumFontName = ""
    
    static var italicFontName = ""
    
    static var lightFontName = ""
    
    static var boldFontName = ""
    
    static func defaultFont(size : CGFloat, type : FontType) -> UIFont {
        
        switch type {
            
        case .regular:
            return UIFont.systemFont(ofSize: size)
            
        case .bold:
            return UIFont.boldSystemFont(ofSize: size)
          
        case .medium:
            return UIFont.systemFont(ofSize: size)
            
        case .italic:
            return UIFont.italicSystemFont(ofSize: size)
            
        case .light:
            return UIFont.systemFont(ofSize: size)
            
        }
        
    }
    
}



