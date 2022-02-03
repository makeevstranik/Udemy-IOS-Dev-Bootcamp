//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Евгений Макеев on 31.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct K {
    static let loginId = "LoginToChat"
    static let registerId = "RegisterToChat"
    static let chatId = "LoginToChat"
    static let cellId = "ReusableCell"
    static let appName = "⚡️FlashChat"
    static let cellNibName = "MessageCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
}
