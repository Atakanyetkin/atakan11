//
//  favProductVC.swift
//  Geyim Burada
//
//  Created by atakan yetkin on 14.12.2022.

import UIKit

class FavProductVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        setupUI()
    }
    
    func setupUI(){
        
        lazy var backButton = UIButton()
        backButton.setImage(UIImage(named: "Left.png"), for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalTo(32)
            
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }
        
        lazy var favProductLabel = UILabel()
        favProductLabel.text = "Favorite Product"
        favProductLabel.textAlignment = .left
        favProductLabel.textColor = .textColor
        favProductLabel.font = Font.header3().withSize(14)
        view.addSubview(favProductLabel)
        favProductLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(64)
        }
        
    }
    @objc func backButtonTapped(){
        
        Presentation.presentVC(currentVC: self, destinationVC: HomeVC(), toDirection: .left)
        
        
    }
    
}
    

