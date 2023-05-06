//  mainAllPokemonInteractor.swift
//  PokeDex(V)
//
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class mainAllPokemonInteractor: mainAllPokemon_PresenterToInteractorProtocol {
    weak var presenter: mainAllPokemon_InteractorToPresenterProtocol?
    
    func getAllPokemon(){
        PokeSerivesProvider.shared.getAllPokemon { response, error in
            (error == nil) ?
            self.presenter?.responseGetPokesFromInteractor(with: response?.pokemon_entries ?? []) :
            self.presenter?.errorToGetPokemon(with: [])
        }
    }
    
    func getFirstSprite(){
        
    }

}


