//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by Евгений Макеев on 20.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    let Date: String
    let PreviousDate: String
    let Valute: [String: Item]
}
struct Item: Codable {
    let ID: String
    let NumCode: String
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
}
