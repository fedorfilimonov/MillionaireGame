//
//  MainViewController.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 28.10.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func playButtonOnTap(_ sender: UIButton) {
        guard gameContent.first != nil else {
            return noQuestionsError()
        }
        
        let newGameSession = GameSession()
        GameSingleton.shared.gameSession = newGameSession
        
        performSegue(withIdentifier: "PlayGameSegue", sender: nil)
    }
    
    @IBAction func resultsButtonOnTap(_ sender: Any) {
        performSegue(withIdentifier: "ResultsSegue", sender: nil)
    }
    
    @IBAction func settingsButtonOnTap(_ sender: Any) {
        performSegue(withIdentifier: "GoToSettingsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayGameSegue" {
            let vc = segue.destination as! GameScreenViewController
            vc.gameScreenDelegate = self
        }
        else { return }
    }

    func noQuestionsError() {
        let alert = UIAlertController(title: "Ошибка", message: "Нет вопросов.", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Добавить вопросы", style: UIAlertAction.Style.default, handler: {_ in
            self.performSegue(withIdentifier: "GoToSettingsSegue", sender: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension MainViewController: GameScreenDelegate {
    func didEndGame(result: Int, date: Date, numberOfQuestions: Int) {
        let currentScore = GameSession()
        currentScore.date = date
        currentScore.numberOfQuestions = numberOfQuestions
        currentScore.numberOfCorrectAnswers = result
        
        let percent = (Double(result) / Double(numberOfQuestions)) * 100
        
        print(result)
        print(numberOfQuestions)
        print("\(percent)%")
        currentScore.percentageOfAnsweredQuestions = Int(percent)
        
        let gameResultToSave = GameRecord(date: currentScore.date, numberOfQuestions: currentScore.numberOfQuestions, numberOfCorrectAnswers: currentScore.numberOfCorrectAnswers, percentageOfAnsweredQuestions: currentScore.percentageOfAnsweredQuestions)
        
        GameSingleton.shared.addGameResult(result: gameResultToSave)
    }
}
