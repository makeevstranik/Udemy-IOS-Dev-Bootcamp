//
//  ErrorMessage.swift
//  Flash Chat iOS13
//
//  Created by Евгений Макеев on 31.01.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ErrorMessage {
    weak var delegate: UIViewController?
    
    func show(_ title: String, _ error: Error? ) -> Void {
        guard let err = error else { return }
        showAlert(title, "\(err.localizedDescription)")
    }
    
    func show(_ title: String, _ message: String) {
        showAlert(title, message)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        guard let delegate = self.delegate else { return }
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            delegate.present(alert, animated: true, completion: nil)
        }
    }
}
