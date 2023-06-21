//
//  HeaderCollectionReusableView.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/15.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "\(HeaderCollectionReusableView.self)"
    
    //Banner海報輪播
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        //設定GIF輪播照片，照片名稱為我們剛剛匯入assets，檔名編號以前的部分，接著輸入稍大的duration來減緩播放速度
        imageView.image = UIImage.animatedImageNamed("banner", duration: 10)
       
        return imageView
    }()
    
    //CollectionView Title
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "飲  料  總  覽"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor = appTintColor
        
        return label
    }()

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerImageView)
        addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            
            // 製造長寬為1920*1080的比例
            bannerImageView.heightAnchor.constraint(equalTo: bannerImageView.widthAnchor, multiplier: 0.5625),
        ])
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 16)

        ])
    }
    
}
