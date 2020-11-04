//
//  QuestionsSingleton.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import Foundation

class QuestionsSingleton {
    
    static let shared = QuestionsSingleton()
    
    private let addQuestionsCaretaker = AddQuestionCaretaker()
    
    private(set) var questionsList: [Question] {
        didSet {
            addQuestionsCaretaker.saveQuestions(questions: questionsList)
        }
    }
    
    private init(){
        questionsList = addQuestionsCaretaker.loadQuestions() ?? []
    }
    
    func addQuestion(question: Question) {
        questionsList.insert(question, at: 0)
    }

}
