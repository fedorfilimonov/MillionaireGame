//
//  SettingsScreenViewController.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import UIKit

class SettingsScreenViewController: UIViewController {
    
    @IBOutlet weak var questionsOrderControl: UISegmentedControl!
    
    private var selectedQuestionsOrder: QuestionsOrder {
        switch questionsOrderControl.selectedSegmentIndex {
        case 0:
            return .sequential
        case 1:
            return .random
        default:
            return .sequential
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(GameSingleton.shared.questionsOrder)
        
        if GameSingleton.shared.questionsOrder == .sequential {
            questionsOrderControl.selectedSegmentIndex = 0
        }
        
        else { questionsOrderControl.selectedSegmentIndex = 1 }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        GameSingleton.shared.questionsOrder = selectedQuestionsOrder
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addQuestionButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "AddQuestionSegue", sender: nil)
    }
    
}
