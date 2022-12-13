//
//  Font.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 07.12.2022.
//

import UIKit

final class Font {
    enum FontWeight {
        case light
        case regular
        case medium
        case semibold
        case bold
    }

    static func custom(size: CGFloat = 14, fontWeight: FontWeight = .medium, multiplier: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-\(fontWeight)",
                      size: size * UIScreen.main.bounds.height * 0.00115)!
    }

    static func header1() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 22 * UIScreen.main.bounds.height * 0.00115)!
    }

    static func header2() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 18 * UIScreen.main.bounds.height * 0.00115)!
    }

    static func header3() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 16 * UIScreen.main.bounds.height * 0.00115)!
    }
}
