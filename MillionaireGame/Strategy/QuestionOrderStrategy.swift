//
//  QuestionOrderStrategy.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import Foundation

protocol QuestionOrderStrategy {

    func createArrayOfQuestions() -> [Question]
}
