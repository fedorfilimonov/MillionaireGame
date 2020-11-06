//
//  AddQuestionCaretaker.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import Foundation

class AddQuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    func saveQuestions(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Question]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

