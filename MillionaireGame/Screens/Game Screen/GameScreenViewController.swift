//
//  GameScreenViewController.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 28.10.2020.
//

import UIKit

protocol GameScreenDelegate: AnyObject {
    func didEndGame(result: Int, date: Date, numberOfQuestions: Int)
}

class GameScreenViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBAction func answer1ButtonOnTap(_ sender: Any) {
        nextRound(answer: (answer1Button.titleLabel?.text)!)
    }
    
    @IBAction func answer2ButtonOnTap(_ sender: Any) {
        nextRound(answer: (answer2Button.titleLabel?.text)!)
    }
    
    @IBAction func answer3ButtonOnTap(_ sender: Any) {
        nextRound(answer: (answer3Button.titleLabel?.text)!)
    }
    
    @IBAction func answer4ButtonOnTap(_ sender: Any) {
        nextRound(answer: (answer4Button.titleLabel?.text)!)
    }
    
    var round: Int = 0
    
    weak var gameScreenDelegate: GameScreenDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstRound()
    }
    
    func firstRound() {
        let roundOne = gameContent[round]
        
        questionLabel.text = roundOne.question
        answer1Button.setTitle(roundOne.answer1, for: .normal)
        answer2Button.setTitle(roundOne.answer2, for: .normal)
        answer3Button.setTitle(roundOne.answer3, for: .normal)
        answer4Button.setTitle(roundOne.answer4, for: .normal)
    }
    
    func nextRound(answer: String) {
        
        let winDate = Date()
        let numberOfQuestions = gameContent.count
        
        if answer == gameContent[round].correctAnswer && round < gameContent.count - 1 {
            
            let alert = UIAlertController(title: "Правильно!", message: "Это правильный ответ!\nВаш результат \(round + 1) из \(numberOfQuestions)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            round += 1
            let nextRound = gameContent[round]
            
            questionLabel.text = nextRound.question
            answer1Button.setTitle(nextRound.answer1, for: .normal)
            answer2Button.setTitle(nextRound.answer2, for: .normal)
            answer3Button.setTitle(nextRound.answer3, for: .normal)
            answer4Button.setTitle(nextRound.answer4, for: .normal)
        }
        
        else if answer == gameContent[round].correctAnswer && round == gameContent.count - 1 {
            round += 1
            gameScreenDelegate.didEndGame(result: round, date: winDate, numberOfQuestions: numberOfQuestions)
            
            let alert = UIAlertController(title: "Игра окончена!", message: "Ваш результат \(round) из \(numberOfQuestions)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: {_ in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            gameScreenDelegate.didEndGame(result: round, date: winDate, numberOfQuestions: numberOfQuestions)
            
            let alert = UIAlertController(title: "Неправильно!", message: "Игра окончена. Правильный ответ \(gameContent[round].correctAnswer)\nВаш результат \(round) из \(numberOfQuestions)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: {_ in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

