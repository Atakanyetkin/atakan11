//
//  ViewController.swift
//  Font Changer
//
//  Created by Uzay Altıner on 16.11.2022.
//

import SnapKit
import UIKit

final class OnboardingVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
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



