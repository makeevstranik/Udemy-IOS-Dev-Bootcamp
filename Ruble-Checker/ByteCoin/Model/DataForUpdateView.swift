//
//  DataUpdateView.swift
//  ByteCoin
//
//  Created by Евгений Макеев on 21.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct DataForUpdateView {
    let ticker: String
    let time: String
    let previousTime: String
    let course: String
    let previousCourse: String
    var change: String
    var buttonColor: UIColor {
        if change.first == "-" {
            return .red
        } else {
            return .green
        }
    }
    let backCourse: String
    let previousBackCourse: String    
}
