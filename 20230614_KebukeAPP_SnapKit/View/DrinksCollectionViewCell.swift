//
//  DrinksCollectionViewCell.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/15.
//

import UIKit
import Kingfisher

class DrinksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(DrinksCollectionViewCell.self)"
    
    //飲料圖片
    var drinksImageView: UIImageView! = {
        let imageView = UIImageView()
//        let img_url = "https://www.kebuke.com/wp-content/uploads/2020/12/胭脂紅茶-1.jpg"
//        let img_url_here = URL(string: img_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
//        imageView.kf.setImage(with: img_url_here)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //飲料名稱
    var drinksNameLabel: UILabel! = {
        let label = UILabel()
//        label.text = "春芽冷露"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //飲料價錢
    var drinksPriceLabel: UILabel! = {
        let label = UILabel()
//        label.text = "中：$35 / 大：$45"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //飲料敘述
    var drinksDescLabel: UILabel! = {
        let label = UILabel()
//        textField.text = "很好喝，很好喝，很好喝，很好喝，很好喝，很好喝，很好喝"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(drinksImageView)
        contentView.addSubview(drinksNameLabel)
        addSubview(drinksPriceLabel)
        addSubview(drinksDescLabel)

    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.width - (16*2)
        
        //飲料圖片
        drinksImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drinksImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            drinksImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            drinksImageView.widthAnchor.constraint(equalToConstant: imageSize),
            drinksImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])
        
        //飲料名稱
        drinksNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drinksNameLabel.topAnchor.constraint(equalTo: drinksImageView.bottomAnchor, constant: 16),
            drinksNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            drinksNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        //飲料價錢
        drinksPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drinksPriceLabel.topAnchor.constraint(equalTo: drinksNameLabel.bottomAnchor, constant: 4),
            drinksPriceLabel.leadingAnchor.constraint(equalTo: drinksNameLabel.leadingAnchor),
            drinksPriceLabel.trailingAnchor.constraint(equalTo: drinksNameLabel.trailingAnchor)
        ])
        
        //飲料敘述
        drinksDescLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drinksDescLabel.topAnchor.constraint(equalTo: drinksPriceLabel.bottomAnchor, constant: 8),
            drinksDescLabel.leadingAnchor.constraint(equalTo: drinksNameLabel.leadingAnchor),
            drinksDescLabel.trailingAnchor.constraint(equalTo: drinksNameLabel.trailingAnchor)
        ])
        
    }
}
