//
//  DetailViewController.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/14.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class DetailViewController: UIViewController{
    
    
    //容量 Segment Control
    let capacity = ["中杯", "大杯"]
    
    //要上傳的訂單資料
    var orders = [uploadFields]()
    
    //飲料容量價錢
    var selectSizePrice: Int = 0
    
    //飲料加料價錢
    var selectExtraPrice: Int = 0
    
    //飲料圖片網址
    var imgString: String!
    
    //上一頁傳來的飲料資訊
    let detailDrink: Fields
    
    init(detailDrink: Fields) {
        self.detailDrink = detailDrink
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //飲料圖片
    var detailImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //飲料價錢
    var detailPriceLabel: UILabel! = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    //飲料敘述
    var detailDescLabel: UILabel! = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    //選擇容量 標題
    var titleLabel: UILabel! = {
        let label = UILabel()
        label.text = "選擇容量"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    
    
    var capacityTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "選擇容量"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    func titleLabelStyle() -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }
    
    
    //選擇容量 SegmentControl
    var capacitySegmentControl: UISegmentedControl! = {
        let capacity = ["中杯", "大杯"]
        let segmentControl = UISegmentedControl(items: capacity)
        
        segmentControl.selectedSegmentTintColor = appSecondaryColor
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentControl.selectedSegmentIndex = 0
        
        
        return segmentControl
    }()
    
    //選擇冰塊 標題
    var iceTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "選擇冰塊"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    //選擇冰塊 Button
    var iceButton: UIButton! = {
        let button = UIButton()
        button.backgroundColor = appSecondaryColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()

    //選擇糖度 標題
    var sugarTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "選擇糖度"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    //選擇糖度 Button
    var sugarButton: UIButton! = {
        let button = UIButton()
        button.backgroundColor = appSecondaryColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    //選擇加料 標題
    var extraTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "選擇加料"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    //選擇加料 Button
    var extraButton: UIButton! = {
        let button = UIButton()
        button.backgroundColor = appSecondaryColor
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    //輸入姓名 標題
    var inputTitleLabel: UILabel! = {
        let label = UILabel()
        label.text = "訂購姓名"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = appTintColor
        label.numberOfLines = 0
        return label
    }()
    
    //輸入姓名 InputTextField
    var inputTextField: UITextField! = {
        let textField = UITextField()
        textField.backgroundColor = appSecondaryColor
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        
        let placeholderText = "請輸入您的姓名"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14),
            .paragraphStyle: paragraphStyle
        ]

        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        textField.textAlignment = .center
        
        return textField
    }()
    
    //訂購 CTA Button
    var addButton: UIButton! = {
        let button = UIButton()
        button.backgroundColor = appTintColor
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitle("訂購", for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = appBackgroundColor
        
        mainUI()
        
        //AutoLayout 相關
//        setAutoLayout()
        
        //下拉選單 冰塊、糖度、加料
        setDropDownMenu(buttonName: iceButton)
        setDropDownMenu(buttonName: sugarButton)
        setDropDownMenu(buttonName: extraButton)
        
        capacitySegmentControl.addTarget(self, action: #selector(changeCapacity), for: .valueChanged)
        addButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        self.inputTextField.delegate = self
        
        
        
        
    }
    
    
    
    //頁面主要資訊 - 選定飲料
    func mainUI(){
  
        navigationItem.title = detailDrink.fields.drinks
        
        imgString = detailDrink.fields.img_url
        let imgUrl = URL(string: imgString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)

        detailImageView.kf.setImage(with: imgUrl)
        detailPriceLabel.text = "中：$\(detailDrink.fields.med_price) / 大：$\(detailDrink.fields.large_price)"
        detailDescLabel.text = detailDrink.fields.desc
        
        selectSizePrice = detailDrink.fields.med_price
        
        //訂購按鈕預設顯示 中杯飲料價錢
        addButton.setTitle("訂購 ($\(selectSizePrice.description))", for: .normal)

    }
    
    //訂購按鈕的價錢
    func updatePriceUI(){
        addButton.setTitle("訂購 ($\(selectSizePrice + selectExtraPrice))", for: .normal)
    }
    
    //ScrollView 按空白處收鍵盤
    @objc func singleTapGestureCaptured(gesture: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    //AutoLayout設定
    override func viewDidLayoutSubviews() {
        
        //Scroll View 避免超出View，要可以捲動
        scrollView = UIScrollView(frame: view.safeAreaLayoutGuide.layoutFrame)
        
        //終於找到問題，scroll可以捲動的關鍵！！
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 640)
//        scrollView.isScrollEnabled = true
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(singleTapGestureCaptured))
        scrollView.addGestureRecognizer(touch)
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        
        
        //飲料圖片
        scrollView.addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.size.width / 2 )
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(scrollView).offset(16)
        }
        
        //飲料價錢
        scrollView.addSubview(detailPriceLabel)
        detailPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        detailPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(16)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        //飲料敘述
        scrollView.addSubview(detailDescLabel)
        detailDescLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDescLabel.snp.makeConstraints { make in
            make.top.equalTo(detailPriceLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.leading.trailing.equalTo(self.view).inset(24)
        }
        
        
        // ================= 下半頁：選單 ================= //
        
        
        //輸入姓名 標題
        scrollView.addSubview(inputTitleLabel)
        inputTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(detailDescLabel.snp.bottom).offset(36)
            make.leading.equalTo(detailDescLabel.snp.leading)
        }
        
        //輸入姓名 TextField
        scrollView.addSubview(inputTextField)
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.snp.makeConstraints { make in
            make.centerY.equalTo(inputTitleLabel.snp.centerY)
            make.leading.equalTo(self.view.frame.size.width/2)
            make.trailing.equalTo(self.view.snp.trailing).offset(-24)
            make.height.equalTo(32)
        }
        
        //選擇容量 標題
        scrollView.addSubview(capacityTitleLabel)
        capacityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        capacityTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(inputTitleLabel.snp.bottom).offset(36)
            make.leading.equalTo(detailDescLabel.snp.leading)
        }
        
        
        //選擇容量 SegmentControl
        scrollView.addSubview(capacitySegmentControl)
        capacitySegmentControl.translatesAutoresizingMaskIntoConstraints = false
        capacitySegmentControl.snp.makeConstraints { make in
            make.centerY.equalTo(capacityTitleLabel.snp.centerY)
            make.leading.equalTo(self.view.frame.size.width / 2)
            make.trailing.equalTo(self.view.snp.trailing).offset(-24)
        }
        
        //選擇冰塊 標題
        scrollView.addSubview(iceTitleLabel)
        iceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        iceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(capacityTitleLabel.snp.bottom).offset(36)
            make.leading.equalTo(detailDescLabel.snp.leading)
        }
        
        //選擇冰塊 Button
        scrollView.addSubview(iceButton)
        iceButton.translatesAutoresizingMaskIntoConstraints = false
        iceButton.snp.makeConstraints { make in
            make.centerY.equalTo(iceTitleLabel.snp.centerY)
            make.leading.equalTo(self.view.frame.size.width/2)
            make.trailing.equalTo(self.view.snp.trailing).offset(-24)
        }
        
        //選擇糖度 標題
        scrollView.addSubview(sugarTitleLabel)
        sugarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sugarTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iceTitleLabel.snp.bottom).offset(36)
            make.leading.equalTo(detailDescLabel.snp.leading)
        }
        
        //選擇糖度 Button
        scrollView.addSubview(sugarButton)
        sugarButton.translatesAutoresizingMaskIntoConstraints = false
        sugarButton.snp.makeConstraints { make in
            make.centerY.equalTo(sugarTitleLabel.snp.centerY)
            make.leading.equalTo(self.view.frame.size.width/2)
            make.trailing.equalTo(self.view.snp.trailing).offset(-24)
        }
        
        //選擇加料 標題
        scrollView.addSubview(extraTitleLabel)
        extraTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        extraTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sugarTitleLabel.snp.bottom).offset(36)
            make.leading.equalTo(detailDescLabel.snp.leading)
        }
        
        //選擇加料 Button
        scrollView.addSubview(extraButton)
        extraButton.translatesAutoresizingMaskIntoConstraints = false
        extraButton.snp.makeConstraints { make in
            make.centerY.equalTo(extraTitleLabel.snp.centerY)
            make.leading.equalTo(self.view.frame.size.width/2)
            make.trailing.equalTo(self.view.snp.trailing).offset(-24)
        }
        
        
        //訂購 Button
        scrollView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.snp.makeConstraints { make in
            make.top.equalTo(extraTitleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(self.view).inset(24)
            make.height.equalTo(48)
        }
        
    }
    
    
    //更多選項 下拉選單
    func setDropDownMenu(buttonName: UIButton){
        
        var selectArray = [String]()
        var menuActions = [UIAction]()
        
        //根據UIButton Name 選擇飲料細項
        switch buttonName{
        case iceButton:
            selectArray = ["正常冰","少冰","微冰","去冰","完全去冰","常溫","溫","熱"]
        case sugarButton:
            selectArray = ["正常糖","少糖","半糖","微糖","兩分糖","一分糖","無糖"]
        case extraButton:
            selectArray = ["無", "白玉", "水玉", "甜杏"]
        default:
            selectArray = []
        }
        
        buttonName.showsMenuAsPrimaryAction = true
        buttonName.changesSelectionAsPrimaryAction = true
        buttonName.layer.cornerRadius = 5
        buttonName.layer.masksToBounds = true
        
        selectExtraPrice = 0
        
        //下拉選單的選項
        for selectItems in selectArray{
            menuActions.append(UIAction(title: selectItems, state: .on, handler: { action in
                
                //判斷有沒有加料要加錢
                switch action.title {
                case "白玉":
                    self.selectExtraPrice = 10
                case "水玉":
                    self.selectExtraPrice = 10
                case "甜杏":
                    self.selectExtraPrice = 15
                default: self.selectExtraPrice = 0
                }
                self.updatePriceUI()
            }))
        }
        buttonName.menu = UIMenu(children: menuActions)
    }
    
    //容量大小 Segment Control 改變價錢
    @objc func changeCapacity(sender: UISegmentedControl) {
        switch capacitySegmentControl.selectedSegmentIndex{
        case 0:
            selectSizePrice = detailDrink.fields.med_price
        case 1:
            selectSizePrice = detailDrink.fields.large_price
        default:
            selectSizePrice = detailDrink.fields.med_price
        }
        updatePriceUI()
    }
    
    //紀錄當下的日期、時間
    func recordDatetime() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        
        let currentTime = dateFormatter.string(from: Date())
        
        return currentTime
    }
    
    //加入購物車 Button
    @objc func addToCart() {
        
        let selectCapacity = capacity[capacitySegmentControl.selectedSegmentIndex]
        
        let selectedDrink = detailDrink.fields.drinks
        
        let currentTime = recordDatetime()
        
        if let selectedIce = iceButton.titleLabel?.text,
           let selectedSugar = sugarButton.titleLabel?.text,
           let selectedExtra = extraButton.titleLabel?.text,
           let inputName = inputTextField.text,
           inputName.count != 0 {

            //飲料訂購確認通知
            let confirmMessage = "\(selectedDrink), \(selectCapacity)\n \(selectedIce), \(selectedSugar), 加料：\(selectedExtra),\n 訂購人：\(inputName),\n $\(selectSizePrice + selectExtraPrice)"
            
            let controller = UIAlertController(title: "訂購確認", message: confirmMessage, preferredStyle: .alert)
            
            //確認
            let okAction = UIAlertAction(title: "確認", style: .default) { _ in
                
                //再多跳一個訂購成功通知
                let successController = UIAlertController(title: "訂購成功", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                successController.addAction(okAction)
                self.present(successController, animated: true)
                
                //最終訂單資訊
                self.orders.append(uploadFields(fields: uploadOrder(Name: inputName, Drink: selectedDrink, Sugar: selectedSugar, Ice: selectedIce, Capacity: selectCapacity, Others: selectedExtra, Img_url: self.imgString, Price: self.selectSizePrice + self.selectExtraPrice, UploadDatetime: currentTime)))
                
                //上傳AirTable
                self.uploadItems()

            }
            
            controller.addAction(okAction)

            //取消
            let cancelAction = UIAlertAction(title: "取消", style: .cancel)
            controller.addAction(cancelAction)
            present(controller, animated: true)
            

        } else{
            let controller = UIAlertController(title: "訂購失敗", message: "請輸入訂購人姓名", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               controller.addAction(okAction)
               present(controller, animated: true)
        }
        
        
    }
    
    
        
    //上傳資料到AirTable
    func uploadItems(){
        let url = URL(string: "https://api.airtable.com/v0/appUt8q96SSLnVvKS/Imported%20table")!
        var request = URLRequest(url: url)
        
        request.setValue("Bearer pat8hEsRPuvajaQZG.0a546e5968b51e45ea8a90f7942485d620072c41fd8eaeedaad7253e136bea3c", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()

        let data = try? encoder.encode(["records": orders])
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { data, response, error in
        if let data {
        let decoder = JSONDecoder()
            do {
                let _ = try decoder.decode(uploadRecords.self, from: data)
//                print(createUserResponse)
                print("資料已上傳")
            } catch {
                print(error)
            }
        }
        }.resume()
    }
   
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

