//  mainAllPokemonInteractor.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class mainAllPokemonInteractor: mainAllPokemon_PresenterToInteractorProtocol {
    
    weak var presenter: mainAllPokemon_InteractorToPresenterProtocol?
    
    //MARK: - G E T · A L L · P O K E M O N
    func getAllPokemon(){
        PokeServicesProvider.shared.getAllPokemon { response, error in
            (error == nil) ?
            self.presenter?.responseGetPokesFromInteractor(with: response?.pokemon_entries ?? []) :
            self.presenter?.errorToGetPokemon(with: [])
        }
    }
    
    //MARK: - G E T · P O K E M O N
    func getPokemon(of idPokemon: String){
        PokeServicesProvider.shared.getSprites(of: idPokemon) { response, error in
            if let response = response  {
                (error == nil) ? self.presenter?.responseGetPokemonFromInteractor(with: response) : self.presenter?.errorToGetPokemon()
            }else { return }
        }
    }
    
    //MARK: - G E T · C H A I N · E V O L U T I O N
    func getEvolution(of idPokemon: String) {
        PokeServicesProvider.shared.getChainEvolution(of: idPokemon) { response, error in
            if let response  = response  {
                (error == nil) ? self.presenter?.responseGetPokeEvolutionFromInteractor(with: response) : self.presenter?.errorToGetEvolution()
            }else {return}
        }
    }
}
