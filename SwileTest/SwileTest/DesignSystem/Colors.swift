//
//  Colors.swift
//  SwileTest
//
//  Created by Mateus de Campos on 15/03/23.
//

import UIKit

extension UIColor {
    static var background: UIColor {
        UIColor { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return .black
            } else {
                return .white
            }
        }
    }

    static var borderGray: UIColor {
        UIColor { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 1, green: 1, blue: 1, alpha: 0.06)
            } else {
                return UIColor(red: 0, green: 0, blue: 0, alpha: 0.06)
            }
        }
    }

    static var borderWhite: UIColor {
        return background
    }

    static var illustrationOrange: UIColor {
        return UIColor(red: 1, green: 0.922, blue: 0.831, alpha: 1)
    }

    static var illustrationPink: UIColor {
        return UIColor(red: 0.996, green: 0.878, blue: 0.941, alpha: 1)
    }

    static var illustrationRed: UIColor {
        return UIColor(red: 0.996, green: 0.878, blue: 0.882, alpha: 1)
    }
}
