//
//  SecondaryTableViewCell.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/15.
//

import UIKit
import Kingfisher

class SecondaryTableViewCell: UITableViewCell {
    
    //訂單飲料圖片
    var orderImageView: UIImageView! = {
        let orderImageView = UIImageView()
        let img_url = "https://www.kebuke.com/wp-content/uploads/2020/12/胭脂紅茶-1.jpg"
        let img_url_here = URL(string: img_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        orderImageView.kf.setImage(with: img_url_here)
        orderImageView.contentMode = .scaleAspectFill
        orderImageView.layer.cornerRadius = 20
        orderImageView.clipsToBounds = true
        return orderImageView
    }()
    
    //訂單大名
    var orderNameLabel: UILabel! = {
        let orderNameLabel = UILabel()
//        orderNameLabel.text = "Eric"
        orderNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        orderNameLabel.textColor = .white
        return orderNameLabel
    }()
    
    //訂單飲料
    var orderDrinkLabel: UILabel! = {
        let orderDrinkLabel = UILabel()
//        orderDrinkLabel.text = "春芽冷露"
        orderDrinkLabel.font = .systemFont(ofSize: 16)
        orderDrinkLabel.textColor = .white
        return orderDrinkLabel
    }()
    
    //訂單飲料詳細
    var orderDetailLabel: UILabel! = {
        let orderDetailLabel = UILabel()
//        orderDetailLabel.text = "中杯 / 正常冰 / 正常糖 / 無"
        orderDetailLabel.font = .systemFont(ofSize: 14)
        orderDetailLabel.textColor = .lightGray
        return orderDetailLabel
    }()
    
    //訂單價錢
    var orderPriceLabel: UILabel! = {
        let orderPriceLabel = UILabel()
//        orderPriceLabel.text = "$45"
        orderPriceLabel.font = .systemFont(ofSize: 16)
        orderPriceLabel.textColor = .lightGray
        return orderPriceLabel
    }()
    
    //訂單時間
    var orderDatetimeLabel: UILabel! = {
        let orderDatetimeLabel = UILabel()
//        orderDatetimeLabel.text = "2023-06-15 09:00:00"
        orderDatetimeLabel.font = .systemFont(ofSize: 16)
        orderDatetimeLabel.textColor = .lightGray
        return orderDatetimeLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "\(SecondaryTableViewCell.self)")
        
        //Cell的內容都要用contentView來設定
        contentView.backgroundColor = appSecondaryColor
        
        contentView.addSubview(orderImageView)
        contentView.addSubview(orderNameLabel)
        contentView.addSubview(orderPriceLabel)
        contentView.addSubview(orderDrinkLabel)
        contentView.addSubview(orderDetailLabel)
        contentView.addSubview(orderDatetimeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //AutoLayout相關
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height / 1.5
        
        orderImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            orderImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            orderImageView.widthAnchor.constraint(equalToConstant: imageSize),
            orderImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])
        
        orderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderNameLabel.leadingAnchor.constraint(equalTo: orderImageView.trailingAnchor, constant: 16),
            orderNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderNameLabel.topAnchor.constraint(equalTo: orderImageView.topAnchor, constant: 4)
        ])
 
        orderPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            orderPriceLabel.topAnchor.constraint(equalTo: orderNameLabel.topAnchor)
        ])
        
        orderDrinkLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderDrinkLabel.topAnchor.constraint(equalTo: orderNameLabel.bottomAnchor, constant: 16),
            orderDrinkLabel.leadingAnchor.constraint(equalTo: orderNameLabel.leadingAnchor)
        ])
        
        orderDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderDetailLabel.topAnchor.constraint(equalTo: orderDrinkLabel.bottomAnchor, constant: 8),
            orderDetailLabel.leadingAnchor.constraint(equalTo: orderNameLabel.leadingAnchor)
        ])
        
        orderDatetimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderDatetimeLabel.topAnchor.constraint(equalTo: orderDetailLabel.bottomAnchor, constant: 8),
            orderDatetimeLabel.leadingAnchor.constraint(equalTo: orderNameLabel.leadingAnchor)
        ])
        
        
        
    }
    
}
