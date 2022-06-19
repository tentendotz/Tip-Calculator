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
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        calculatorBrain.tipTitle = sender.currentTitle!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Double(billTextField.text!)
        if let safeBill = bill {
            calculatorBrain.calculateBill(bill: safeBill)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
        let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.finalResult
            destinationVC.tipResult = calculatorBrain.tipTitle
            destinationVC.split = calculatorBrain.numberOfPeople
        }
    }
}

