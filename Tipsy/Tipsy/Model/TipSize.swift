//
//  TipSize.swift
//  Tipsy
//
//  Created by Евгений Макеев on 13.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
enum TipSize: Int {
    case zero=0
    case ten=10
    case twelve=20
    
    var textRawValue: String {
        return String(self.rawValue)
    }
}
