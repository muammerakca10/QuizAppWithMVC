//
//  ViewController.swift
//  QuizApp
//
//  Created by Muammer on 27.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var currentQuestion = 0
    var score = 0
    
    var questions = [Question(text: "A slug's blood is green.", answer: "True"),
                     Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
                     Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
                     Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
                     Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
                     Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
                     Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
                     Question(text: "Google was originally called 'Backrub'.", answer: "True"),
                     Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
                     Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
                     Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
                     Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
                    ]
    
    //Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[0].text
        
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text!
        let rightAnswer = questions[currentQuestion].answer
        
        if userAnswer == rightAnswer {
            print("Right")
            score += 1
        } else {
            print("Wrong")
        }
        
        if currentQuestion + 1 < questions.count{
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = questions[currentQuestion].text
        progressBar.progress = Float(currentQuestion) / Float(questions.count - 1)
        scoreLabel.text = "Score : \(score)"
    }
}

