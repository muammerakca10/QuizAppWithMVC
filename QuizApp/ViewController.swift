//
//  ViewController.swift
//  QuizApp
//
//  Created by Muammer on 27.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()

    var currentQuestion = 0
    var score = 0
    
    
    
    //Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizBrain.questions.shuffle()
        questionLabel.text = quizBrain.questions[0].text
        
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text!
        let isAnswerRight = quizBrain.checkAnswer(userAnswer: userAnswer!)
        
        if isAnswerRight {
            sender.backgroundColor = .green
            print("Right")
            score += 1
        } else {
            sender.backgroundColor = .red
            print("Wrong")
        }
        
        
        updateUI()
    }
    
    func updateUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
            questionLabel.text = getQuestionText()
            progressBar.progress = Float(currentQuestion) / Float(questions.count - 1)
            scoreLabel.text = "Score : \(score)"
            trueButton.backgroundColor = .none
            falseButton.backgroundColor = .none
        }
    }
}

