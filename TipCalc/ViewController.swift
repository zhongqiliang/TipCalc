//
//  ViewController.swift
//  TipCalc
//
//  Created by ZhongQi Liang on 15/3/1.
//  Copyright (c) 2015年 ZhongQi Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    let formatter = NSNumberFormatter()
    var tipPercentages = [0.18, 0.2, 0.22]
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var total2People: UILabel!
    @IBOutlet weak var total3People: UILabel!
    @IBOutlet weak var total4People: UILabel!
    @IBOutlet weak var splitBackGroundLower: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        total2People.text = "0.00"
        total3People.text = "0.00"
        total4People.text = "0.00"

        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let corlorTheme = defaults.integerForKey("corlor_theme")
        switch corlorTheme {
        case CorlorTheme.Dark.rawValue:
            view.backgroundColor = UIColor.darkGrayColor()
            splitBackGroundLower.backgroundColor = UIColor.whiteColor()
        default:
            view.backgroundColor = UIColor.greenColor()
            splitBackGroundLower.backgroundColor = UIColor.blackColor()
        }

        tipControl.selectedSegmentIndex = defaults.integerForKey("tip_percentage_index")
        
        var currencyLocale = "en_US"
        switch defaults.integerForKey("currency") {
        case Currency.CNY.rawValue :
            currencyLocale = "zh_CN"
        case Currency.RUB.rawValue :
            currencyLocale = "ru_RU"
        default:
            currencyLocale = "en_US"
        }
        formatter.locale = NSLocale(localeIdentifier: currencyLocale)
        onEditingChanged(self)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        var total = billAmount + tip
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        total2People.text = formatter.stringFromNumber(total / 2)
        total3People.text = formatter.stringFromNumber(total / 3)
        total4People.text = formatter.stringFromNumber(total / 4)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

