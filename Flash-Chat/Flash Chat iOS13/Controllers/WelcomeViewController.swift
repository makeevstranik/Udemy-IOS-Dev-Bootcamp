//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import GhostTypewriter

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ghostLabel: TypewriterLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = " "
        let animation = K.appName
        let ghostAnimation = "👻Ghost Anime"
        
        //    printAnimationMain(animation) { el in
        //        self.titleLabel.text?.append(contentsOf: String(el))
        //    }
        
        // swift >=5.5 delay with async/await
        Task {
            for el in animation {
                try? await Task.sleep(nanoseconds: 1_000_000_00)
                titleLabel.text?.append(contentsOf: String(el))
            }
        }
        
        ghostLabel.text = ghostAnimation
        ghostLabel.animationDirection = .forward
        ghostLabel.typingTimeInterval = 0.1
        ghostLabel.startTypewritingAnimation()
        
        // MARK: - 3 version of delay function
        // make detached queue for delay then go back to main thread
        func printAnimation(_ animation: String, _ callback: @escaping (Character) -> Void) {
            for (ind, el) in animation.enumerated() {
                DispatchQueue(label: "animation").asyncAfter(deadline: .now() +
                                                             DispatchTimeInterval.milliseconds(ind * 100)) {
                    DispatchQueue.main.async {
                        callback(el)
                    }
                }
            }
        }
        // timer - Angela version from curse
        func printAnimationWithTimer(_ animation: String, _ callback: @escaping (Character) -> Void) {
            for (ind, el) in animation.enumerated() {
                Timer.scheduledTimer(withTimeInterval: Double(ind) * 0.1, repeats: false) { timer in
                    callback(el)
                }
            }
        }
        // delay in main thread
        func printAnimationMain(_ animation: String, _ callback: @escaping (Character) -> Void) {
            for (ind, el) in animation.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() +
                                              DispatchTimeInterval.milliseconds(ind * 100)) {
                    callback(el)
                }
            }
        }
        
    }
}

