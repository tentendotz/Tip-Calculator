//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by tetsuta matsuyama on 2022/06/17.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipTitle = "10%"
    var tipNumber = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipTitle = sender.currentTitle!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Double(billTextField.text!)
        
        if let safeBill = bill {
            let buttonTitleMinusPercentSign = Double(tipTitle.dropLast())!
            tipNumber = buttonTitleMinusPercentSign / 100
            let result = safeBill * (1 + tipNumber) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
            
        }
        
    
    }


}

