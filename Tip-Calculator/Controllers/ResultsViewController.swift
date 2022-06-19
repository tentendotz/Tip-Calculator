//
//  ResultsViewController.swift
//  Tip-Calculator
//
//  Created by tetsuta matsuyama on 2022/06/18.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String?
    var tipResult: String?
    var split: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split!) people, with \(tipResult!) tip."
    
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
