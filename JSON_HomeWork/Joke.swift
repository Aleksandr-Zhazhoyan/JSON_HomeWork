//
//  Joke.swift
//  JSON_HomeWork
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let joke: String?
    let setup: String?
    let delivery: String?
    
    var fullJoke: String {
        if let setup = setup, let delivery = delivery {
            return "\(setup) - \(delivery)"
        }
        return joke ?? "No joke"
    }
}
