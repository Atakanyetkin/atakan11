//
//  HomeVC.swift
//  Geyim Burada
//
//  Created by Y. Yılmaz Erdoğmuş on 13.12.2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        lazy var nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.backgroundColor = .green
        nextButton.addCornerRadious()
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(80)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: HomeVC(), toDirection: .right)
    }
    
}

//test

