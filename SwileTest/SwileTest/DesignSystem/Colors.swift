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

    static var illustrationGray: UIColor {
        return UIColor(red: 0.965, green: 0.965, blue: 0.973, alpha: 1)
    }

    static var highlightBackground: UIColor {
        return UIColor(red: 0.902, green: 0.878, blue: 0.973, alpha: 1)
    }

    static var highlightText: UIColor {
        return UIColor(red: 0.388, green: 0.247, blue: 0.827, alpha: 1)
    }

    static var subtitleText: UIColor {
        UIColor { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 0.905, green: 0.894, blue: 0.949, alpha: 1)
            } else {
                return UIColor(red: 0.569, green: 0.545, blue: 0.651, alpha: 1)
            }
        }
    }

    static var titleText: UIColor {
        UIColor { traitCollection -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 0.925, green: 0.914, blue: 0.969, alpha: 1)
            } else {
                return UIColor(red: 0.114, green: 0.067, blue: 0.282, alpha: 1)
            }
        }
    }

    static var headingText: UIColor {
        return titleText
    }

    static var actionHighlightText: UIColor {
        return highlightText
    }

    static var sectionText: UIColor {
        return subtitleText
    }

}
