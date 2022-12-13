//
//  UIView+Extension.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import Foundation
import UIKit

extension UIView {
    func addCornerRadious(_ radius: CGFloat = 12) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }

    func setGradientLayer(gradientColors: [CGColor]) {
        let layer0 = CAGradientLayer()
        layer0.colors = gradientColors
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(0, 1.68, -1.68, 0, 1.34, 0))
        layer0.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        layer0.position = self.center
        self.layer.addSublayer(layer0)
    }

    func gradientImage(bounds: CGRect, colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]

        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.layer.addSublayer(gradient)
    }

    func makeCircle() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.size.height / 2
    }
}
