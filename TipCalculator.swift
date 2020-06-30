//
//  TipCalc.swift
//  Tip Calculator
//
//  Created by Varun on 6/25/20.
//  Copyright © 2020 Varun. All rights reserved.
//
import Foundation

class TipCalc
{
    // Variable Declaration
    var tipAmount: Double = 0
    var amountBeforeTax: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    // Initialization
    init(amountBeforeTax: Double, tipPercentage: Double)
    {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    // Calculate Tip
    func calculateTip()
    {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
    }
}
