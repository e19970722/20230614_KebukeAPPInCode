//
//  SecondaryTableViewController.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/14.
//

import Foundation
import UIKit
import Kingfisher

class SecondaryTableViewController: UITableViewController {
    
    var drinkOrders = [uploadFields]()
    
//    var drinkOrders = [uploadFields(fields: uploadOrder(Name: "Yen", Drink: "飲料名稱", Sugar: "正常", Ice: "正常", Capacity: "中杯", Others: "無", Img_url: "https://www.kebuke.com/wp-content/uploads/2020/12/胭脂紅茶-1.jpg", Price: 35, UploadDatetime: "2023-06-15 09:00:00"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appBackgroundColor
        navigationItem.title = "我的訂單"
        
        tableView.register(SecondaryTableViewCell.self, forCellReuseIdentifier: "\(SecondaryTableViewCell.self)")

        tableView.delegate = self
        tableView.dataSource = self
        
        fetchItems()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkOrders.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondaryTableViewCell.self)", for: indexPath) as? SecondaryTableViewCell else { fatalError("DequeReuse SecondaryTableViewCell Failed.") }
        
        let drinkOrder = drinkOrders[indexPath.row]

        let imgUrl = URL(string: drinkOrder.fields.Img_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        cell.orderImageView.kf.setImage(with: imgUrl)

        cell.orderNameLabel.text = drinkOrder.fields.Name
        cell.orderDrinkLabel.text = drinkOrder.fields.Drink
        cell.orderDetailLabel.text = "\(drinkOrder.fields.Capacity) / \(drinkOrder.fields.Ice) / \(drinkOrder.fields.Sugar) / \(drinkOrder.fields.Others)"
        cell.orderPriceLabel.text = "$\(drinkOrder.fields.Price.description)"

        cell.orderDatetimeLabel.text = drinkOrder.fields.UploadDatetime
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func fetchItems(){
        let url = URL(string: "https://api.airtable.com/v0/appUt8q96SSLnVvKS/Imported%20table")!
        var request = URLRequest(url: url)
        
        request.setValue("Bearer pat8hEsRPuvajaQZG.0a546e5968b51e45ea8a90f7942485d620072c41fd8eaeedaad7253e136bea3c", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data{
                let decoder = JSONDecoder()
                do{
                    let searchResponse = try decoder.decode(uploadRecords.self, from: data)
                    self.drinkOrders = searchResponse.records
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch{
                    print(error)
                }
            }
        }.resume()
    }
}
