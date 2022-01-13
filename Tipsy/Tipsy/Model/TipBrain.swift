//
//  TipBrain.swift
//  Tipsy
//
//  Created by Евгений Макеев on 13.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct TipBrain {
    
    private var splitedValue = 0.0
    var bill = 0.0
    var tip: TipSize = .zero
    
    var stepperValue = 1.0 {
        didSet {
            if self.stepperValue <= 0 || self.stepperValue >= 26 {
                self.stepperValue = oldValue
            }
        }
    }
    mutating func calculate(bill: Double) {
        self.splitedValue = (bill + bill * Double(tip.rawValue) / 100) / stepperValue
    }
    var textSplitedValue: String {
        return String(format: "%.2f", splitedValue)
    }
    var textStepperValue: String {
        return String(format: "%.0f", stepperValue)
    }
}
