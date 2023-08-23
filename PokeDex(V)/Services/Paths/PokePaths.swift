//  PokePaths.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 13/07/23.

import Foundation

enum PokePaths {
    case allPokemon
    
    
    func getPokePath() -> String {
        switch self {
        case .allPokemon:
            return "https://pokeapi.co/api/v2/pokedex/1/"
        }
    }
    
}
