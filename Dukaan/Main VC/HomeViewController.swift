//
//  HomeViewController.swift
//  Dukaan
//
//  Created by leyo babu on 28/01/21.
//  Copyright © 2021 leyo babu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeTableView = UITableView()
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: CGFloat(104), height: CGFloat(104))
        layout.minimumLineSpacing = 10;
        
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    var homeScrollView = UIScrollView()
    var mainView = UIView()
    var tableViewContainer = UIView()
    var adsViewContainer = UIView()
    var collectionViewContainer = UIView()
    var topView = UIView()
    struct Cells {
           static let homeCell = "trendingCell"
       }
    
    var sectionArray = [[String]]()
    var sectionPriceArray = [[Int]]()
    var sectionOfferPriceArray = [[Int]]()
    var sectionDiscountArray = [[Int]]()
    var sectionItemAddedArray = [[Int]]()
    var sectionItemCountArray = [[Int]]()
    var sectionHeader = ["Ice Cream","Home Food","Fruit Salads"]
    let item1Array = ["Ice Cream Bowl","Baskin Robbin’s Scoop Cup","Ice Cream Bowl Chocolate","Kwality Walls Black Currant","Ice Cream Bowl","Baskin Robbin’s Scoop Cup","Ice Cream Bowl Chocolate","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant","Kwality Walls Black Currant"]
    let item2Array = ["Kwality Walls Black Currant","Ice Cream Bowl"]
    let item3Array = ["Ice Cream Bowl Chocolate"]
    let menuItem = ["Ice Cream Bowl","paneer","Ice Cream Bowl Chocolate"]
    let menuItemName = [""]
    let item1Price = [399,0,0,0,399,0,0,0,0,0,0,0]
    let item2Price = [0,0]
    let item3Price = [0]
    let item1OfferPrice = [209,399,249,175,209,399,249,175,175,175,175,175]
    let item2OfferPrice = [175,209]
    let item3OfferPrice = [249]
    let item1Discount = [30,0,0,0,30,0,0,0,0,0,0,0]
    let item2Discount = [0,0]
    let item3Discount = [0]
    let item1Added = [0,0,0,0,3,0,0,0,0,0,0,0]
    let item2Added = [0,0]
    let item3Added = [0]
    let item1Count = [10,0,10,10,10,10,10,10,10,10,10,10]
    let item2Count = [10,10]
    let item3Count = [10]
    var cellHeight = 124
    var deviceHeight = UIScreen.main.bounds.size.height
    var deviceWidth = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMethods()
        
    }
// MARK:- INIT METHOD
    func initMethods(){
        self.view.backgroundColor = .white
        self.preaparingDataFromArray()
        self.configureTableView()
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: Cells.homeCell)
        self.homeTableView.isScrollEnabled = false
        let tapGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
// MARK:- PREPARE DATA FROM ARRAY
    func preaparingDataFromArray(){ // STATIC DATA IS CREATED AS NO FREE API WAS AVAILABLE
        sectionArray.append(item1Array)
        sectionArray.append(item2Array)
        sectionArray.append(item3Array)
        sectionPriceArray.append(item1Price)
        sectionPriceArray.append(item2Price)
        sectionPriceArray.append(item3Price)
        sectionOfferPriceArray.append(item1OfferPrice)
        sectionOfferPriceArray.append(item2OfferPrice)
        sectionOfferPriceArray.append(item3OfferPrice)
        sectionDiscountArray.append(item1Discount)
        sectionDiscountArray.append(item2Discount)
        sectionDiscountArray.append(item3Discount)
        sectionItemAddedArray.append(item1Added)
        sectionItemAddedArray.append(item2Added)
        sectionItemAddedArray.append(item3Added)
        sectionItemCountArray.append(item1Count)
        sectionItemCountArray.append(item2Count)
        sectionItemCountArray.append(item3Count)
    }

    
    func configureTableView(){
        // Create Scroll view
        homeScrollView.frame = view.frame
        view.addSubview(homeScrollView)
        // Create Mian view
        mainView.frame = homeScrollView.frame
        self.homeScrollView.addSubview(self.mainView)
        // Create Top View
        topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 130))
        topView.backgroundColor = .white
        self.mainView.addSubview(topView)
        let sellerImage = UIImageView(frame: CGRect(x: 20, y: 20, width: 56, height: 56))
        sellerImage.image = UIImage(named: "shop")
        topView.addSubview(sellerImage)
        let sellerName = UILabel(frame: CGRect(x: (sellerImage.frame.origin.x + sellerImage.frame.size.width + 10), y: 30, width: deviceWidth/1.8, height: 20))
        sellerName.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        sellerName.textColor = UIColor(hexFromString: "#1A181E")
        sellerName.text = "Mano Super Market"
        topView.addSubview(sellerName)
        let trustedImage = UIImageView(frame: CGRect(x: (sellerImage.frame.origin.x + sellerImage.frame.size.width + 10), y: (sellerName.frame.origin.y + sellerName.frame.size.height + 5), width: 15, height: 15))
        trustedImage.image = UIImage(named: "tick")
        topView.addSubview(trustedImage)
        let trustedName = UILabel(frame: CGRect(x: (trustedImage.frame.origin.x + trustedImage.frame.size.width + 10), y: (sellerName.frame.origin.y + sellerName.frame.size.height + 5), width: deviceWidth/1.8, height: 20))
        trustedName.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        trustedName.textColor = UIColor(hexFromString: "#17B31B")
        trustedName.text = "TRUSTED SELLER"
        topView.addSubview(trustedName)
        let textFieldView = UIView(frame: CGRect(x: 15, y: (trustedImage.frame.origin.y + trustedImage.frame.size.height + 15), width: view.frame.size.width-30, height: 30))
        textFieldView.layer.cornerRadius = 6
        textFieldView.backgroundColor = UIColor(hexFromString: "#F2F2F2")
        topView.addSubview(textFieldView)
        let textField = UITextField(frame: CGRect(x: 10, y: 0, width: textFieldView.frame.size.width-10, height: textFieldView.frame.size.height))
        textField.placeholder = "Search for products…"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.isUserInteractionEnabled = true
        textFieldView.addSubview(textField)
        let borderView = UIView(frame: CGRect(x: 0, y: topView.frame.size.height-1, width: view.frame.size.width, height: 1))
        borderView.backgroundColor = UIColor(hexFromString: "#E6E6E6")
        topView.addSubview(borderView)
        
        // Create collectionview container
        collectionViewContainer = UIView(frame: CGRect(x: 0, y: topView.frame.size.height, width: view.frame.size.width, height: 180))
        self.mainView.addSubview(collectionViewContainer)
        let collectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        collectionHeaderView.backgroundColor = .clear
        collectionViewContainer.addSubview(collectionHeaderView)
        let collectionHeaderLabel = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.size.width-20, height: 40))
        collectionHeaderLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        collectionHeaderLabel.textColor = UIColor(hexFromString: "#1A181E")
        collectionHeaderLabel.text = "Bestsellers"
        collectionHeaderView.addSubview(collectionHeaderLabel)
        self.mainView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: CGFloat(cellHeight+20)).isActive = true
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Create tableview container
        tableViewContainer = UIView(frame: CGRect(x: 0, y: (collectionViewContainer.frame.origin.y + collectionViewContainer.frame.size.height), width: view.frame.size.width, height: deviceHeight))
        tableViewContainer.backgroundColor = .clear
        self.mainView.addSubview(tableViewContainer)
        tableViewContainer.addSubview(homeTableView)
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView.rowHeight = 110
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: tableViewContainer.bottomAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor, constant: 0).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor, constant: 0).isActive = true
    }
}

// MARK:- Extension Of VC for table view delegate and datasource
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       self.sectionArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeTableView.dequeueReusableCell(withIdentifier: Cells.homeCell, for: indexPath) as? HomeTableViewCell ?? HomeTableViewCell()
        
        if sectionArray.count > 0 {
            let menuItemName:String = self.sectionArray[indexPath.section][indexPath.row]
            if menuItemName != "" {
                cell.menuItemName.text = menuItemName
            }
            cell.menuItemImage.image = UIImage(named: self.sectionArray[indexPath.section][indexPath.row])
            if sectionOfferPriceArray.count > 0 {
                cell.menuItemOfferPrice.text = "₹\(self.sectionOfferPriceArray[indexPath.section][indexPath.row])"
            }
            if sectionPriceArray.count > 0 {
                let itemPrice = self.sectionPriceArray[indexPath.section][indexPath.row]
                if itemPrice > 0 {
                    let attrString = NSAttributedString(string: "₹\(itemPrice)", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
                    cell.menuItemPrice.attributedText = attrString
                }else {
                    cell.menuItemPrice.text = ""
                }
            }
            if sectionDiscountArray.count > 0 {
                let itemDiscount = self.sectionDiscountArray[indexPath.section][indexPath.row]
                if itemDiscount > 0 {
                    cell.menuOfferView.isHidden = false
                    cell.menuOfferValue.text = "\(itemDiscount)% OFF"
                }else {
                    cell.menuOfferValue.text = ""
                    cell.menuOfferView.isHidden = true
                }
            }
            if sectionItemCountArray.count > 0 {
                let itemCount = sectionItemCountArray[indexPath.section][indexPath.row]
                if itemCount > 0 {
                    if sectionItemAddedArray.count > 0 {
                        let itemAdded = self.sectionItemAddedArray[indexPath.section][indexPath.row]
                        if itemAdded > 0 {
                            cell.menuItemAlreadyAddedView.isHidden = false
                            cell.menuItemAddView.isHidden = true
                            cell.noMenuItemText.isHidden = true
                            cell.menuItemCount.text = "\(itemAdded)"
                        }else {
                            cell.menuItemCount.text = ""
                            cell.noMenuItemText.isHidden = true
                            cell.menuItemAlreadyAddedView.isHidden = true
                            cell.menuItemAddView.isHidden = false
                        }
                    }
                }else{
                    cell.menuItemAlreadyAddedView.isHidden = true
                    cell.menuItemAddView.isHidden = true
                    cell.noMenuItemText.isHidden = false
                }
            }
            
        }
        // determine height and change it
        if indexPath.row == (5 - 1) {
          UIView.animate(withDuration: 0, animations: {
            self.homeTableView.layoutIfNeeded()
          }) { complete in
            self.tableViewContainer.frame.size.height = self.homeTableView.contentSize.height
            self.adsViewContainer = UIView(frame: CGRect(x: 0, y: (self.tableViewContainer.frame.origin.y + self.tableViewContainer.frame.size.height), width: self.view.frame.size.width, height: 300))
            self.adsViewContainer.backgroundColor = UIColor(hexFromString: "#1A181E")
            self.mainView.addSubview(self.adsViewContainer)
            let adsImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.adsViewContainer.frame.size.height))
            adsImage.image = UIImage(named: "ads")
            adsImage.contentMode = .scaleAspectFit
            self.adsViewContainer.addSubview(adsImage)
            self.homeScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: (self.homeTableView.contentSize.height + self.topView.frame.size.height + self.collectionViewContainer.frame.size.height + self.adsViewContainer.frame.size.height))
          }
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 20, y: 7, width: 100, height: 25))
        label.text = self.sectionHeader[section]
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        let labelSize = label.getSize(constrainedWidth:200.0)
        returnedView.addSubview(label)
        let countView = UIView(frame: CGRect(x: (labelSize.width+30), y: 10, width: 27, height: 19))
        countView.layer.cornerRadius = 4
        countView.backgroundColor = UIColor(hexFromString: "#146eb4")
        returnedView.addSubview(countView)
        let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 27, height: 19))
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        countLabel.textColor = .white
        countLabel.text = "\(sectionArray[section].count)"
        countView.addSubview(countLabel)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if sectionArray[section].count > 10 {
            let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
            returnedView.backgroundColor = .white
            let countView = UIView(frame: CGRect(x: view.frame.size.width/4, y: 5, width: view.frame.size.width/2, height: 30))
            countView.backgroundColor = UIColor(hexFromString: "#f2f2f2")
            countView.layer.cornerRadius = 4
            returnedView.addSubview(countView)
            let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width/2, height: 30))
            countLabel.textAlignment = .center
            countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            countLabel.textColor = UIColor(hexFromString: "#4d4d4d")
            countLabel.text = "SEE ALL PRODUCTS >"
            countView.addSubview(countLabel)
            return returnedView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sectionArray[section].count > 10 {
            return 60
        }else {
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124 , height: CGFloat(cellHeight-20))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell ?? HomeCollectionViewCell()
//        cell.backgroundColor = .blue
        cell.menuImage.image = UIImage(named: self.menuItem[indexPath.row])
        cell.menuName.text = sectionHeader[indexPath.row]
        
        return cell
    }
    
    
}



// MARK:- UICOLOR EXTENSION
extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

extension UILabel {
    func getSize(constrainedWidth: CGFloat) -> CGSize {
        return systemLayoutSizeFitting(CGSize(width: constrainedWidth, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}

