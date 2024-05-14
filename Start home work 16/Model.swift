//
//  Model.swift
//  Start home work 16
//
//  Created by Арайлым Сермагамбет on 14.05.2024.
//

import Foundation

struct CardsResponse: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String
    let type: String
    let setName: String?
    let manaCost: String?
    let rarity: String?
    
    enum CodingKeys: String, CodingKey {
        case name, type, manaCost, rarity
        case setName = "set_name"
    }
}
