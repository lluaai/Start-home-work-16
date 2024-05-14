//
//  ViewController.swift
//  Start home work 16
//
//  Created by Арайлым Сермагамбет on 14.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.magicthegathering.io/v1/cards?name=Black+Lotus"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, reponce, error in
            if let error = error{
                print(error)
                return
            }
            guard let data = data else { return }
            
                        do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CardsResponse.self, from: data)
                if let firstCard = response.cards.first {
                    print("Имя карты: \(firstCard.name)")
                    print("Тип: \(firstCard.type)")
                    print("Название сета: \(firstCard.setName ?? "N/A")")
                    print("Мановая стоимость: \(firstCard.manaCost ?? "N/A")")
                    print("Редкость: \(firstCard.rarity ?? "N/A")")
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
}


