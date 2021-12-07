//
//  ViewController.swift
//  Magic-8-Ball
//
//  Created by Евгений Макеев on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wishLableView: UILabel!
    @IBOutlet weak var imageBallView: UIImageView!
    
    let wishes = ["Happy", "Fell In Love", "Over The Moon", "On Seven Haven", "Overwhelming By Love"]
    let images: [UIImage] = [#imageLiteral(resourceName: "Ball2"), #imageLiteral(resourceName: "Ball4"), #imageLiteral(resourceName: "Ball3") , #imageLiteral(resourceName: "Ball5") ]
                             
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func wishButton(_ sender: UIButton) {
        wishLableView.text = wishes.randomElement()
        imageBallView.image = images.randomElement()
    }
    
}

