//
//  BackButton.swift
//  Font Changer
//
//  Created by Uzay Altıner on 17.11.2022.
//

import UIKit

final class CustomButton: UIButton {
    private var image: UIImage?

    init(image: UIImage?) {
        super.init(frame: .zero)
        self.image = image
        self.setupUI(image: image!)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(image: UIImage) {
        self.setBackgroundImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.tintColor = .black
        self.backgroundColor = .white
    }
}
