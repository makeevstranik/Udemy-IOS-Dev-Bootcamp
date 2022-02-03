//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by Евгений Макеев on 01.02.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

struct Message {
    let sender: String
    let body: String
    let time: Timestamp
}
