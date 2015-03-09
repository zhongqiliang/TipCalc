//
//  UserViewController.swift
//  TipCalc
//
//  Created by ZhongQi Liang on 15/3/1.
//  Copyright (c) 2015年 ZhongQi Liang. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var tipPercentage: UISegmentedControl!
    
    @IBOutlet weak var corlorTheme: UISegmentedControl!
    
    @IBOutlet weak var currency: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentage.selectedSegmentIndex = defaults.integerForKey("tip_percentage_index")
        corlorTheme.selectedSegmentIndex = defaults.integerForKey("corlor_theme")
        currency.selectedSegmentIndex = defaults.integerForKey("currency")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTipPercentageValueChanged(sender: AnyObject) {
        defaults.setInteger(tipPercentage.selectedSegmentIndex, forKey: "tip_percentage_index")

    }

    @IBAction func onCorlorThemeValueChanged(sender: AnyObject) {
        let corlor : CorlorTheme! = CorlorTheme(rawValue: corlorTheme.selectedSegmentIndex)
        defaults.setInteger(corlor.rawValue, forKey: "corlor_theme")
    }

    @IBAction func onCurrencyValueChanged(sender: AnyObject) {
        let cur : Currency! = Currency(rawValue: currency.selectedSegmentIndex)
        defaults.setInteger(cur.rawValue, forKey: "currency")
    }
    
    @IBAction func onTouchDown(sender: AnyObject) {
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }

}
