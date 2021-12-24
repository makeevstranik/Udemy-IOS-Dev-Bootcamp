//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if quizBrain.checkAnswer(userAnswer: Answer(rawValue: tag)!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateQuestionNumber()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestion
        scoreLabel.text = String(quizBrain.score)
        
        zeroButton.backgroundColor = UIColor.clear
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        
        zeroButton.setTitle(quizBrain.getAnswerVariants(position: 0), for: .normal)
        firstButton.setTitle(quizBrain.getAnswerVariants(position: 1), for: .normal)
        secondButton.setTitle(quizBrain.getAnswerVariants(position: 2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress
    }
 
}
    
    
    


