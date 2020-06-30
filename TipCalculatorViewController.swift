//
//  TipCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Varun on 6/25/20.
//  Copyright © 2020 Varun. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var resultPerPersonLabel: UILabel!
    
    //  Object declaration
    var tipCalculator = TipCalc(amountBeforeTax: 0.00, tipPercentage: 0.2)
    
    // View controller lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalculator.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip: %d%%", arguments: [Int(tipCalculator.tipPercentage * 100)])
    }
    
    // Calculate the bill after tip
    func calculateBill()
    {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value)
        tipCalculator.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    // Update the labels
    func updateUI()
    {
        resultLabel.text = String(format: "Tip: $%0.2f and Total: $%0.2f", arguments:[tipCalculator.tipAmount, tipCalculator.totalAmount])
        let numberOfPeople: Int = Int(splitSlider.value)
        resultPerPersonLabel.text = String(format: "Cost Per Person: $%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    // Calculate the bill after user changes amount
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any)
    {
        calculateBill()
    }
    
    // Change in text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == amountBeforeTaxTextField
        {
            textField.resignFirstResponder()
            calculateBill()
        }
        return true
    }
    
    // Calculating the bill after the tip slider is changed
    @IBAction func tipPercentageSliderValueChanged(_ sender: Any)
    {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calculateBill()
    }

    // Calculating the bill after the split slider is changed
    @IBAction func splitSliderValueChanged(_ sender: Any)
    {
        splitLabel.text = "Split: \(Int(splitSlider.value))"
        calculateBill()
    }
}
