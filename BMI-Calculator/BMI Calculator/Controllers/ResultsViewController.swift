//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Евгений Макеев on 10.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var adviseLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var bmi: Bmi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmi?.getBmiText ?? "No text"
        adviseLabel.lineBreakMode = .byWordWrapping
        adviseLabel.numberOfLines = 0 
        adviseLabel.text = bmi?.advise ?? "No advise"
        view.backgroundColor = bmi?.color ?? .brown
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
