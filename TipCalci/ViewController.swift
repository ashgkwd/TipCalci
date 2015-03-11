//
//  ViewController.swift
//  TipCalci
//
//  Created by admin on 11/03/15.
//  Copyright (c) 2015 Jinesh Kamdar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tipCalciObj = TipCalci(bA: 100, tP: 0.12)
    var myValues: [String: String]!
    var myArray: [String]!

    @IBOutlet var billAmount: UITextField!
    @IBOutlet var taxPercentage: UISlider!
    @IBOutlet var displayTips: UITextView!
    @IBOutlet var displayTable: UITableView!
    
    @IBAction func showTip(sender: UISlider) {
        tipCalciObj.billAmount = Double((self.billAmount.text as NSString).doubleValue) //converts string to double explicitly
        
        tipCalciObj.taxPercentage = Double(self.taxPercentage.value)/100.0

        self.myValues = tipCalciObj.getTip()
        self.myArray = sorted(myValues.keys)
        displayTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myValues = tipCalciObj.getTip()
        self.myArray = sorted(myValues.keys)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4//1 + self.myValues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellwa")
        
        if indexPath.row != 0 {
            cell.textLabel?.text = self.myArray[indexPath.row - 1] + " : " + self.myValues[self.myArray[indexPath.row - 1]]!
        } else {
            cell.textLabel?.text = "Total Tax: \(taxPercentage.value)"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var totalBill = myValues[myArray[indexPath.row - 1]]! + "\(tipCalciObj.billAmount)"
        let myAlert = UIAlertController(title: "Your Bill Details", message: "Your Total Bill Amount After Tip Is \(totalBill)", preferredStyle: UIAlertControllerStyle.Alert)
        myAlert.addAction(UIAlertAction(title: "Pay It", style: UIAlertActionStyle.Default, handler:nil))
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
}

