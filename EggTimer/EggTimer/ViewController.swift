//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let hardness = ["Hard" : 10, "Medium" : 8, "Soft" : 4]
    let urlDoneSound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    
    struct TimeLeft {
        let allTime: Int
        var left: Int
        
        init(time: Int) {
            allTime = time
            left = time
        }
        
        var isTimeOver: Bool {
            left == 0
        }
        
        var getProgress: Float {
            return 1.0 - Float(left)/Float(allTime)
        }
        
        mutating func timeGo() {
            left -= 1
        }
        
        mutating func timeUpdate() {
            left = allTime
        }
    }
 
    var timer = Timer()
   
    
    @IBAction func hardnessSelected(_ sender: UIButton!) {
        progressBar.progress = 0.0
        updateMainLabel(text: "How do you like your eggs?")
        timer.invalidate()
        let title = sender.currentTitle!
        var timeLeft = TimeLeft(time: hardness[title]!)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {  timer in
            print("seconds left: \(timeLeft.left)")
            timeLeft.timeGo()
            self.progressBar.progress = timeLeft.getProgress
            
            if timeLeft.isTimeOver {
                timer.invalidate()
                timeLeft.timeUpdate()
                self.progressBar.progress = 0.0
                
                self.player = try! AVAudioPlayer(contentsOf: self.urlDoneSound!)
                self.player?.play()
                
                self.updateMainLabel(text: "Your egg is done!")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.updateMainLabel(text: "How do you like your eggs?")
                }
            }
        }
        
    }
    override func viewDidLoad() {
        updateMainLabel(text: "How do you like your eggs?")
        progressBar.progress = 0.0
    }
    func updateMainLabel(text: String) {
        mainLabel.text = text
    }
}
