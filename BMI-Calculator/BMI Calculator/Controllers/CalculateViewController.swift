//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = calculatorBrain.formatText(sender.value, "%.2f") + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = calculatorBrain.formatText(sender.value, "%.0f") + "Kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBmi(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmi = calculatorBrain.getBmi
        }
    }
    
}

