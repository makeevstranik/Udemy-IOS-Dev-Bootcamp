//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipButton10: UIButton!
   
    var tipBrain = TipBrain()
    
    var currentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billValue = Double(billField.text!) else {
            currentButton.isSelected = false
            updateUI()
            return
        }
        
        tipBrain.calculate(bill: billValue)
        self.performSegue(withIdentifier: "toTotal", sender: self)
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        
        currentButton.isSelected = false
        sender.isSelected = true
        currentButton = sender
        billField.endEditing(true)
        
        tipBrain.tip = TipSize(rawValue: sender.tag)!
    }
    @IBAction func stepperChanged(_ sender: UIStepper) {
        tipBrain.stepperValue = sender.value
        splitLabel.text = tipBrain.textStepperValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTotal" {
            let destinationTV = segue.destination as! TotalViewController
            destinationTV.tipBrain = tipBrain
        }
    }
    
    func updateUI() {
        currentButton = tipButton10
        currentButton.isSelected = true
        splitLabel.text = "1"
        tipBrain.stepperValue = 1
        tipBrain.tip = .ten
        billField.text = ""
    }
}

