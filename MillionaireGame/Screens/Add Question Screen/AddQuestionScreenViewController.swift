//
//  AddQuestionScreenViewController.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import UIKit

class AddQuestionScreenViewController: UIViewController {
    
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var correctAnswerField: UITextField!
    @IBOutlet weak var answer2Field: UITextField!
    @IBOutlet weak var answer3Field: UITextField!
    @IBOutlet weak var answer4Field: UITextField!
    
    @IBAction func saveQuestion(_ sender: Any) {
        
        var questionInput: String
        var correctAnswerInput: String
        var answer2Input: String
        var answer3Input: String
        var answer4Input: String
        
        if questionField.text != "" {
            questionInput = questionField.text ?? "Вопрос"
        }
        
        else {
            questionInput = "Вопрос"
        }
        
        if correctAnswerField.text != "" {
            correctAnswerInput = correctAnswerField.text ?? "Правильный ответ"
        }
        
        else {
            correctAnswerInput = "Правильный ответ"
        }
        
        if answer2Field.text != "" {
            answer2Input = answer2Field.text ?? "Неправильный ответ"
        }
        
        else {
            answer2Input = "Неправильный ответ"
        }
        
        if answer3Field.text != "" {
            answer3Input = answer3Field.text ?? "Неправильный ответ"
        }
        
        else {
            answer3Input = "Неправильный ответ"
        }
        
        if answer4Field.text != "" {
            answer4Input = answer4Field.text ?? "Неправильный ответ"
        }
        
        else {
            answer4Input = "Неправильный ответ"
        }
        
        let newQuestion = Question(question: questionInput,
                                   answer1: correctAnswerInput,
                                   answer2: answer2Input,
                                   answer3: answer3Input,
                                   answer4: answer4Input,
                                   correctAnswer: correctAnswerInput)
        
        print("\n\n")
        print("New question added")
        print(newQuestion)
        print("\n\n")
        
        QuestionsSingleton.shared.addQuestion(question: newQuestion)
        
        let alert = UIAlertController(title: "Готово", message: "Вопрос добавлен.", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Добавить еще вопрос", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Выйти", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
