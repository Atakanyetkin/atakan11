//
//  HomeVC.swift
//  Geyim Burada
//
//  Created by Y. Yılmaz Erdoğmuş on 13.12.2022.
//

import UIKit

class HomeVC: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView?
    
    private let products = ["bikini", "dress","man bag","pants", "man shoes", "man underwear", "shirt", "skirt", "Tshirt", "woman bag","woman pants", "woman shoes", "woman tshirt"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        setupUI()
    }
    
    func setupUI(){
        
        lazy var searchBar = UISearchBar()
        searchBar.placeholder = "Search Product"
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.isTranslucent = false
        searchBar.barStyle = .default
        searchBar.searchTextField.borderStyle = .line
        searchBar.addCornerRadious(5)
        searchBar.layer.borderWidth = 1
        searchBar.backgroundColor = .backgroundColor
        searchBar.barTintColor = .backgroundColor
        searchBar.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
        
        
        
        lazy var favProductButton = UIButton()
        favProductButton.setImage(UIImage(named: "love.png"), for: .normal)
        favProductButton.setTitleColor(.white, for: .normal)
        view.addSubview(favProductButton)
        favProductButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-48)
        
            favProductButton.addTarget(self, action: #selector(favProductButtonTapped), for: .touchUpInside)
        }
        
        lazy var notificationButton = UIButton()
        notificationButton.setImage(UIImage(named: "Notification.png"), for: .normal)
        notificationButton.setTitleColor(.white, for: .normal)
        view.addSubview(notificationButton)
        notificationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.right.equalTo(-16)
            
            notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        }
        

        
        //        COLLECTİON VİEW
//        lazy var firstLayout = UICollectionViewFlowLayout()
//        firstLayout.scrollDirection = .horizontal
//        firstLayout.itemSize = CGSize(width: 75, height: 75)
//        firstLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: firstLayout)
//        collectionView?.showsHorizontalScrollIndicator = false
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
//        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
//        collectionView?.backgroundColor = .backgroundColor
//
//        guard let firstCollection = collectionView else {
//            return
//        }
//        view.addSubview(firstCollection)
//
        
        //        COLLECTİON VİEW
      
        lazy var CategoryLabel = UILabel()
        CategoryLabel.text = "Category"
        CategoryLabel.textAlignment = .left
        CategoryLabel.textColor = .textColor
        CategoryLabel.font = Font.header3().withSize(14)
        view.addSubview(CategoryLabel)
        CategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.left.equalToSuperview().offset(32)
        }
        
        
        lazy var moreCategoryLabel = UILabel()
        moreCategoryLabel.text = "More Category"
        moreCategoryLabel.textAlignment = .left
        moreCategoryLabel.textColor = .geyim2
        moreCategoryLabel.font = Font.header3().withSize(14)
        view.addSubview(moreCategoryLabel)
        moreCategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.right.equalToSuperview().offset(-32)
        }
        
//        COLLECTİON VİEW
        
        lazy var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 75, height: 75)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        collectionView?.backgroundColor = .backgroundColor

        guard let buttonCollection = collectionView else {
            return
        }
        view.addSubview(buttonCollection)
        
//        COLLECTİON VİEW
        
        lazy var flashSaleLabel = UILabel()
        flashSaleLabel.text = "Flash Sale"
        flashSaleLabel.textAlignment = .left
        flashSaleLabel.textColor = .textColor
        flashSaleLabel.font = Font.header3().withSize(14)
        view.addSubview(flashSaleLabel)
        flashSaleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(600)
            make.left.equalToSuperview().offset(32)
        }
        
        lazy var seeMoreLabel1 = UILabel()
        seeMoreLabel1.text = "See More"
        seeMoreLabel1.textAlignment = .left
        seeMoreLabel1.textColor = .geyim2
        seeMoreLabel1.font = Font.header3().withSize(14)
        view.addSubview(seeMoreLabel1)
        seeMoreLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(600)
            make.right.equalToSuperview().offset(-32)
        }
        
       
        lazy var megaSaleLabel = UILabel()
        megaSaleLabel.text = "Mega Sale"
        megaSaleLabel.textAlignment = .left
        megaSaleLabel.textColor = .textColor
        megaSaleLabel.font = Font.header3().withSize(14)
        view.addSubview(megaSaleLabel)
        megaSaleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(800)
            make.left.equalToSuperview().offset(32)
        }
        
        
       
        lazy var seeMoreLabel2 = UILabel()
        seeMoreLabel2.text = "See More"
        seeMoreLabel2.textAlignment = .left
        seeMoreLabel2.textColor = .geyim2
        seeMoreLabel2.font = Font.header3().withSize(14)
        view.addSubview(seeMoreLabel2)
        seeMoreLabel2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(800)
            make.right.equalToSuperview().offset(-32)
        }
        
        
        
    }
   
    @objc func favProductButtonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: FavProductVC(), toDirection: .right)
    }
    
    @objc func notificationButtonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: NotificationVC(), toDirection: .right)
    }
    

  
    //    COLLECTİON VİEW İLK
    override func viewDidLayoutSubviews(){
       super.viewDidLayoutSubviews()
     
        collectionView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150).integral
   }
//    COLLECTİON VİEW İLK
  
 
//    override func viewDidfirstLayoutSubviews(){
//       super.viewDidfirstLayoutSubviews()
//       collectionView?.frame = CGRect(x: 0, y: 440, width: view.frame.size.width, height: 150).integral
//   }
    

    
    //    COLLECTİON VİEW YAPIMI
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        cell.configure(with: products[indexPath.row])
        return cell
    }
    //    COLLECTİON VİEW YAPIMI

    
}

 



extension UIColor {
    
    static let geyim2 = UIColor(red: 59/255, green: 183/255, blue: 125/255, alpha: 1)
 //rgb(59,183,125)
}


