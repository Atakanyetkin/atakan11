//
//  UITextfield+Extension.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import SnapKit
import UIKit

extension UITextField {
    enum Direction {
        case left
        case right
    }

    func setIcon(_ image: UIImage, direction: Direction, iconColor: UIColor? = UIColor.gray) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 30, height: 30))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = iconColor
        let iconContainerView = UIView(frame:
            CGRect(x: 0, y: 0, width: 50, height: 40))
        let leftPaddingView = UIView(frame:
            CGRect(x: 0, y: 0, width: 20, height: 40))
        iconContainerView.addSubview(iconView)

        switch direction {
        case .right:
            leftView = leftPaddingView
            leftViewMode = .always
            rightView = iconContainerView
            rightViewMode = .always
        case .left:
            leftView = iconContainerView
            leftViewMode = .always
        }
    }
}
