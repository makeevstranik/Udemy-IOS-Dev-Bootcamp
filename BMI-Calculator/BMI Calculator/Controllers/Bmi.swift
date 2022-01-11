//
//  Bmi.swift
//  BMI Calculator
//
//  Created by Евгений Макеев on 11.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct Bmi {
    let value: Float
    let advise: String
    let color: UIColor
    
    var getBmiText: String {
        return String(format: "%.1f", self.value)
    }
}
