//
//  Pokemon.swift
//  Table View 5 - Pokemon
//
//  Created by Eddi Raimondi on 10/10/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import Foundation
import UIKit

struct PokemonList : Decodable {
    var name : String
    var url : String
    
    func getImage() -> UIImage? {
        let apiUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        let urlPieces = url.split(separator: "/")
        let pokId = urlPieces[urlPieces.count-1]
        
        guard let imgUrl = URL(string: apiUrl + "\(pokId).png") else {
            return nil
        }
        
        print(imgUrl)
        
        guard let imgData = try? Data(contentsOf: imgUrl) else {
            return nil
        }
        
        guard let pokImage = UIImage(data: imgData) else {
            return nil
        }
        
        return pokImage
    }
}

struct PokemonResponse : Decodable {
    var next : String?
    var previus : String?
    var count : Int
    var result : [PokemonList]
}

struct Pokemon {
    
    static let pokemonAPI = "https://pokeapi.co/api/v2/pokemon"
    static let pokemonCount = 100
    
    static func getPokemons(_ pokemonController : PokemonTableViewController) {
        let url = URL(string: pokemonAPI+"?limit=\(pokemonCount)")
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url!) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print(response!)
                return
            }
            
            if httpResponse.statusCode != 200 {
                print(httpResponse)
                return
            }
            // Parse data in JSON
            let decoder = JSONDecoder()
            let jsonData = try? decoder.decode(PokemonResponse.self, from: data!)
            if jsonData != nil {
                DispatchQueue.main.async {
                    pokemonController.pokemons = (jsonData?.result)!
                    pokemonController.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
}
