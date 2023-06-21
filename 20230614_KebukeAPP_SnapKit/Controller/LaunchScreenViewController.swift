//
//  LaunchScreenViewController.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/21.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    
    var launcImage: UIImageView! = UIImageView(image: UIImage(named: "launch logo"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        launcImage.contentMode = .scaleAspectFit
        view.addSubview(launcImage)
    }
    
    override func viewDidLayoutSubviews() {
        launcImage.translatesAutoresizingMaskIntoConstraints = false
        launcImage.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
    }
    

    

}
