//
//  Extension+UIViewController.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import UIKit

extension UIViewController {
    var screenHeight: CGFloat {
        return view.frame.size.height
    }

    var screenWidth: CGFloat {
        return view.frame.size.width
    }

    var stringMultiplier: CGFloat {
        return 0.00115 * self.screenHeight
    }
}
