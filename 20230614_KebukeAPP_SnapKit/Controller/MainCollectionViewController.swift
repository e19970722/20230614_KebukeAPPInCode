//
//  MainViewController.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/14.
//

import Foundation
import UIKit
import Kingfisher


class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //從Airtable獲取飲料總覽資訊
    var menu_items = [Fields]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        fetchItems()
        
        collectionView.backgroundColor = appBackgroundColor
        
        collectionView!.register(DrinksCollectionViewCell.self, forCellWithReuseIdentifier: "\(DrinksCollectionViewCell.self)")
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderCollectionReusableView.self)")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //設定Navigation Title變成Logo圖片
        let navImageView = UIImageView(image: UIImage(named: "logo"))
        navImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = navImageView
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "飲料總覽", style: .plain, target: nil, action: nil)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return menu_items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DrinksCollectionViewCell.self)", for: indexPath) as? DrinksCollectionViewCell else { fatalError("DrinksCollectionViewCell DequeueReuse Failed") }
                
        let menu_item = menu_items[indexPath.item]
        
        cell.drinksNameLabel.text = menu_item.fields.drinks
        cell.drinksPriceLabel.text = "中：\(menu_item.fields.med_price) / 大：\(menu_item.fields.large_price)"
        cell.drinksDescLabel.text = menu_item.fields.desc

        //注意：網址有中文，飲料名稱，要加addingPercentageEncoding作轉換
        let img_url_here = URL(string: menu_item.fields.img_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)

        cell.drinksImageView.kf.setImage(with: img_url_here)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let item = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        let detailDrink = menu_items[indexPath.item]
        let detailViewController = DetailViewController(detailDrink: detailDrink)
        navigationController?.pushViewController(detailViewController, animated: true)
//        print("===================")
//        print(detailDrink.fields.drinks)
    }
    
    
    
    
    
    //設定Cell樣式
    //左右
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //上下
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2)-1,
                      height: collectionView.frame.size.width*0.8)
    }
    
    
    
    
    
    //設定Header Banner GIF
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        //寫上剛剛建立的HeaderCollectionReusableView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        
        return headerView

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width * 0.7)
    }
    
    //抓取AirTable資料
    func fetchItems(){
        let url = URL(string: "https://api.airtable.com/v0/appcvXBVt0RmRZZqk/Imported%20table")!
        var request = URLRequest(url: url)

        //輸入Token，前面記得加Bearer。HeaderField打入Authorization
        request.setValue("Bearer patdTzmSDG0eGLoFm.e45750f8edffa607ce7db5e4a6642bc5de389fad57a5b5d5d43e1ec120a16f12", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response , error in
            if let data {
                let decoder = JSONDecoder()
                do {
                    let searchResponse = try decoder.decode(Records.self, from: data)
                    self.menu_items = searchResponse.records
                                        
                    //要到Main Thread更新資料
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                    } catch {
                        print(error)
                    }
                }
        }.resume()
    }
    
    
}

