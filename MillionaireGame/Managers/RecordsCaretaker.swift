//
//  RecordsCaretaker.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 29.10.2020.
//

import Foundation

class GameRecordCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    func saveGameResults(results: [GameRecord]) {
        do {
            let data = try encoder.encode(results)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadGameResults() -> [GameRecord]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([GameRecord].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func deleteAllGameResults(results: [GameRecord]) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
