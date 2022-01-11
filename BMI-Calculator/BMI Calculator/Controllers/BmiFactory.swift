//
//  BmiFactory.swift
//  BMI Calculator
//
//  Created by Евгений Макеев on 11.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct BmiFactory {
    func getBmi(bmi: Float) -> Bmi {
        switch Int(bmi) {
            case (0...18): return Bmi(value: bmi, advise: "You are Underweight - Eat more!", color: .blue)
            case 19...24: return Bmi(value: bmi, advise: "You are Healthy - Keep going!", color: .green)
            case 25...29: return Bmi(value: bmi, advise: "You are Overweight - Eat less!", color: .cyan)
            case 30...39: return Bmi(value: bmi, advise: "You are Obese - Stop eating!", color: .orange)
            case (40...): return Bmi(value: bmi, advise: "You are Fat - Stop eating at all!", color: .red)
            default: return Bmi(value: 0.0, advise: "Calculating Error", color: .gray)
        }
    }
}
