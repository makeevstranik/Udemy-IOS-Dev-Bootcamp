//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    let urlDict = ["A", "B", "C", "D", "E", "F", "G"].reduce(into: [String: URL](), { acc, el in
        acc.updateValue(Bundle.main.url(forResource: el, withExtension: "wav"), forKey: el)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
        
        playSound(title: title)
        
    }

    func playSound(title: String) {
        guard let url = urlDict[title] else { return }
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }

}

