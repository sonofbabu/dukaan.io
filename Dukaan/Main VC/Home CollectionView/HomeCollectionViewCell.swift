//
//  HomeCollectionViewCell.swift
//  Dukaan
//
//  Created by leyo babu on 29/01/21.
//  Copyright © 2021 leyo babu. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var menuoverlay = UIView()
    var menuName = UILabel()
    var menuImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(menuImage)
        contentView.addSubview(menuoverlay)
        contentView.addSubview(menuName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        menuName.frame = CGRect(x: 5, y: contentView.frame.size.height - 30, width: contentView.frame.size.width-10, height: 30)
        menuName.textAlignment = .center
        menuName.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        menuName.numberOfLines = 2
        menuName.textColor = UIColor.white
        menuImage.frame = CGRect(x: 0, y: 5, width: contentView.frame.size.width-10, height: contentView.frame.size.height-20)
        menuoverlay.frame = CGRect(x: 0, y: -10, width: contentView.frame.size.width-10, height: contentView.frame.size.height+10)
        menuoverlay.backgroundColor = .black
        menuoverlay.alpha = 0.2
        menuImage.contentMode = .scaleAspectFill
        menuImage.layer.cornerRadius = 10
        menuoverlay.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
    }
    
    
}
