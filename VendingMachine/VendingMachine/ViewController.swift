//
//  ViewController.swift
//  VendingMachine
//
//  Created by esung on 2017. 9. 15..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    //PickerView Functions
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priceView.text = String(pickerData[row].price) + currencyLocale
        self.currentItemPrice = pickerData[row].price
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //IBOutlets defined
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet var picker: UIView!
    @IBOutlet var currentCashView: UILabel!
    @IBOutlet var getItemWithCashButton: UIButton!
    
    //IBActions defined
    @IBAction func addCash(btn:UIButton){
       let cash = Int((btn.titleLabel?.text)!)!
        currentCash += cash
        currentCashView.text = String(currentCash) + currencyLocale
        
    }
    @IBAction func getItemWithcash(btn:UIButton){
        currentCash -= currentItemPrice
        currentCashView.text = String(currentCash) + currencyLocale
    }
    
    // GlobalVariables defined
    var pickerData:[VendingItem] = [VendingItem]()
    var currentItemPrice = 0
    var currentCash = 0
    let currencyLocale = "KRW"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let item1 = VendingItem.init(withName: "item1", andPrice: 500)
        let item2 = VendingItem.init(withName: "item2", andPrice: 1000)
        let item3 = VendingItem.init(withName: "item3", andPrice: 100)
        pickerData = [
            item1,item2,item3
        ]
        currentItemPrice = pickerData[0].price
        priceView.text = String(pickerData[0].price) + currencyLocale
        currentCashView.text = String(currentCash) + currencyLocale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
