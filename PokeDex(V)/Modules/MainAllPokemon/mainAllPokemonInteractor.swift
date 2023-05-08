//  mainAllPokemonInteractor.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
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
    
    func getPokemon(of idPokemon: String){
        PokeSerivesProvider.shared.getSprites(of: idPokemon) { response, error in
            if let response = response  {
                if (error == nil) { self.presenter?.responseGetPokemonFromInteractor(with: response)}
                else {self.presenter?.errorToGetPokemon()}
            }else { return }
        }
    }
}
