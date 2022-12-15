//
//  CollectionViewCell.swift
//  Geyim Burada
//
//  Created by atakan yetkin on 15.12.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private let buttonImageView: UIButton = {
        let categoryCircle = UIButton()
        categoryCircle.clipsToBounds = true
        categoryCircle.contentMode = .scaleAspectFit
        categoryCircle.layer.masksToBounds = true
        categoryCircle.layer.cornerRadius = 75.0/2.0
//        categoryCircle.backgroundColor = .backgroundColor
        categoryCircle.tintColor = .gray
        categoryCircle.layer.borderWidth = 1
        categoryCircle.layer.borderColor = UIColor.systemGray.cgColor
        return categoryCircle
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        contentView.addSubview(buttonImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func layoutSubviews() {
        super.layoutSubviews()
         buttonImageView.frame = contentView.bounds
    }
    
    public func configure(with name: String) {
//        buttonImageView.image = UIImage(named: name)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
//        buttonImageView.image = nil
    }
}
