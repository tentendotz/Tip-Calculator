//
//  CalculatorBrain.swift
//  Tip-Calculator
//
//  Created by tetsuta matsuyama on 2022/06/20.
//

import UIKit

struct CalculatorBrain {
    
    var tipTitle = "10%"
    var tipNumber = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    mutating func calculateBill(bill: Double) {
        
        let buttonTitleMinusPercentSign = Double(tipTitle.dropLast())!
        
        tipNumber = buttonTitleMinusPercentSign / 100
    
        let result = bill * (1 + tipNumber) / Double(numberOfPeople)
        finalResult = String(format: "%.2f", result)
    }
}
