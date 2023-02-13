//
//  ViewController.swift
//  a4
//
//  Created by Brandon  Miller on 2/12/23.
//



import UIKit

class ViewController: UIViewController {
    var quizlogic = QuizLogic()
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        let answerSubmitted = sender.titleLabel!.text!
        let isCorrect = quizlogic.compareUserAnswer(answerSubmitted)
        quizlogic.increaseIndex()
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizlogic.getNextQuestion()
        optionOne.setTitle(quizlogic.getChoiceOne(), for: .normal)
        optionTwo.setTitle(quizlogic.getChoiceTwo(), for: .normal)
    }


}

