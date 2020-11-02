//
//  ResultsScreenViewController.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 02.11.2020.
//

import UIKit

class ResultsScreenViewController: UIViewController {
    
    private let gameRecordCaretaker = GameRecordCaretaker()
    
    @IBOutlet weak var resultsTable: UITableView! {
        didSet {
            resultsTable.delegate = self
            resultsTable.dataSource = self
        }
    }
    
    @IBAction func deleteAllResultsButtonOnTap(_ sender: Any) {
        GameSingleton.shared.clearAllGameResults()
        resultsTable.reloadData()
    }
}

extension ResultsScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSingleton.shared.gameResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsScreenTableViewCell", for: indexPath) as! ResultsScreenTableViewCell
        
        let gameResult = GameSingleton.shared.gameResults[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        
        cell.title.text = "Правильных ответов \(gameResult.numberOfCorrectAnswers) из \(gameResult.numberOfQuestions) (\(gameResult.percentageOfAnsweredQuestions)%)"
        cell.subtitle.text = dateFormatter.string(from: gameResult.date)
        
        return cell
    }
}
