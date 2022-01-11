//
//  ClculatorBrain.swift
//  BMI Calculator
//
//  Created by Евгений Макеев on 11.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    
    private var bmi: Bmi?
    
    func formatText(_ value: Float, _ format: String) -> String {
        return String(format: format, value)
    }
    mutating func calculateBmi(height: Float, weight: Float) -> Void {
        self.bmi = BmiFactory().getBmi(bmi: weight / pow(height, 2))
        
    }
    var getBmi: Bmi {
        return self.bmi ?? BmiFactory().getBmi(bmi: 0.0)
    }
}
