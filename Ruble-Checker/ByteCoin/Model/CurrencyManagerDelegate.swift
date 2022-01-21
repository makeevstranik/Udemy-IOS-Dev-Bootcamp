//
//  CurrencyManagerDelegate.swift
//  ByteCoin
//
//  Created by Евгений Макеев on 21.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
protocol CurrencyManagerDelegate {
    func didUpdateCourse(_ currencyParsedData: DataForUpdateView)
    func didFailWithError(_ error: String)
}
