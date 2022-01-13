//
//  ViewController.swift
//  Tipsy
//
//  Created by Евгений Макеев on 13.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    var tipBrain: TipBrain!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = tipBrain.textSplitedValue
        splitLabel.text = "Split between \(tipBrain.textStepperValue) people, with \(tipBrain.tip.textRawValue)% tip"
        
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
