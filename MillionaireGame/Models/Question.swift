//
//  Question.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 28.10.2020.
//

import Foundation

struct Question {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctAnswer: String
}

var gameContent = [
    Question(question: "Какой газ преобладает в атмосфере Земли?", answer1: "Кислород", answer2: "Азот!", answer3: "Углекислый газ", answer4: "Водород", correctAnswer: "Азот!"),
    Question(question: "Какой вид спорта не входит в современное пятиборье?", answer1: "Метание копья", answer2: "Верховая езда", answer3: "Фехтование", answer4: "Плавание!", correctAnswer: "Плавание!"),
    Question(question: "Как иначе называют пиратский флаг?", answer1: "Грязный Гарри", answer2: "Весёлый Роджер!", answer3: "Бедный Йорик", answer4: "Лимонадный Джо", correctAnswer: "Весёлый Роджер!"),
    Question(question: "Как называется популярный рецепт приготовления макарон с мясом?", answer1: "Каша по-генеральски", answer2: "Картошка по-мундирски", answer3: "Макароны по-флотски!", answer4: "Селёдка от-кутюр", correctAnswer: "Макароны по-флотски!"),
    Question(question: "Что является характеристикой коллекционного вина?", answer1: "Стойкость", answer2: "Выдержка!", answer3: "Выносливость", answer4: "Трезвость", correctAnswer: "Выдержка!")
]
