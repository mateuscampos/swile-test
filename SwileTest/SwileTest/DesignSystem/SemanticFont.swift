//
//  SemanticFont.swift
//  SwileTest
//
//  Created by Mateus de Campos on 16/03/23.
//

import UIKit

extension UIFont {
    static var heading1: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.bold, size: 34) else {
            fatalError("could not load font")
        }
        return font
    }

    static var largeMedium: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.medium, size: 15) else {
            fatalError("could not load font")
        }
        return font
    }

    static var smallDefault: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.medium, size: 12) else {
            fatalError("could not load font")
        }
        return font
    }

    static var smallStrong: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.semiBold, size: 12) else {
            fatalError("could not load font")
        }
        return font
    }

    static var defaultMedium: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.medium, size: 13) else {
            fatalError("could not load font")
        }
        return font
    }

    static var defaultStrong: UIFont {
        guard let font = UIFont(name: FontName.monstserrat + "-" + FontFamily.semiBold, size: 13) else {
            fatalError("could not load font")
        }
        return font
    }
}
