//
//  AppColor.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

enum Colors {

    static var appDarkGrey: UIColor {
        return color(
            dark: UIColor(red: 0.25882354378700256, green: 0.25882354378700256, blue: 0.25882354378700256, alpha: 1),
            light: UIColor(red: 0.25882354378700256, green: 0.25882354378700256, blue: 0.25882354378700256, alpha: 1)
        )
    }

    static var appLightGrey: UIColor {
        return color(
            dark: UIColor(red: 0.5372549295425415, green: 0.5372549295425415, blue: 0.5372549295425415, alpha: 1),
            light: UIColor(red: 0.5372549295425415, green: 0.5372549295425415, blue: 0.5372549295425415, alpha: 1)
        )
    }

    static var appDarkOrange: UIColor {
        return color(
            dark: UIColor(red: 0.7686274647712708, green: 0.5176470875740051, blue: 0.0235294122248888, alpha: 1),
            light: UIColor(red: 0.7686274647712708, green: 0.5176470875740051, blue: 0.0235294122248888, alpha: 1)
        )
    }

    static var appRed: UIColor {
        return color(
            dark: UIColor(red: 0.7882353067398071, green: 0.364705890417099, blue: 0.2823529541492462, alpha: 1),
            light: UIColor(red: 0.7882353067398071, green: 0.364705890417099, blue: 0.2823529541492462, alpha: 1)
        )
    }

    static var appGreen: UIColor {
        return color(
            dark: UIColor(red: 0.10196078568696976, green: 0.4745098054409027, blue: 0.003921568859368563, alpha: 1),
            light: UIColor(red: 0.10196078568696976, green: 0.4745098054409027, blue: 0.003921568859368563, alpha: 1)
        )
    }

    static var appLightOrange: UIColor {
        return color(
            dark: UIColor(red: 0.8980392217636108, green: 0.6470588445663452, blue: 0.16078431904315948, alpha: 1),
            light: UIColor(red: 0.8980392217636108, green: 0.6470588445663452, blue: 0.16078431904315948, alpha: 1)
        )
    }
}

extension Colors {

    static func color(dark: UIColor, light: UIColor) -> UIColor {
        guard #available(iOS 13, *) else { return light }
        
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            switch UITraitCollection.userInterfaceStyle {
            case .dark: return dark
            case .light: return light
            default: return light
            }
        }
    }
}

