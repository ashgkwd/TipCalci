//
//  TipCalciLogic.swift
//  TipCalci
//
//  Created by admin on 11/03/15.
//  Copyright (c) 2015 Jinesh Kamdar. All rights reserved.
//

class TipCalci {
    var billAmount: Double!
    var taxPercentage : Double!
    var subTotal: Double! // billAmount without tax
        {
        get {
            return billAmount/(1+taxPercentage)
        }
    }
    
    init(bA: Double, tP:Double) {
        self.billAmount = bA
        self.taxPercentage = tP
        //self.subTotal = bA/(1+tP)
    }
    
    func getTip(tipValue:[Double] = [0.10, 0.15, 0.20]) -> [String : String] {
        var dictForTip = [String : String]()
        for i in tipValue {
            println("subtotal: \(subTotal)")
            dictForTip["\(Int(i*100))%"] = String(format: "%.2f", subTotal * i)
        }
        return dictForTip
    }
}
