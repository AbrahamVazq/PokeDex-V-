//  mainAllPokemonInteractor.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class mainAllPokemonInteractor: mainAllPokemon_PresenterToInteractorProtocol {
    
    weak var presenter: mainAllPokemon_InteractorToPresenterProtocol?
   
    //MARK: - G E T · A L L · P O K E M O N
    func getAllPokemon(){
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration:
                                                                PokeURLConfiguration(strMethod: "https", strHost: "pokeapi.co", path: "/api/v2/pokedex/1") )
        service.launchService { [weak self] (result: Result<PokedexNational, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.responseGetPokesFromInteractor(with: success.pokemon_entries ?? [])
            case .failure(let error):
                self?.presenter?.errorToGetInfo(with: error)
            }
        }
    }
    
    func getSpriteOfPokemon(id: Int) {
        let iID: Int = (id == 0) ? 1 : id
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration:
                                                                PokeURLConfiguration(strMethod: "https", strHost: "pokeapi.co", path: "/api/v2/pokemon/\(iID)") )
        service.launchService { [weak self] (result: Result<Pokemon, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.responseGetPokesFromInteractor(with: success)
            case .failure(let error):
                self?.presenter?.errorToGetInfo(with: error)
            }
        }
    }
    
    //MARK: - G E T · P O K E M O N
    func getPokemon(of idPokemon: String){
//        PokeServicesProvider.shared.getSprites(of: idPokemon) { response, error in
//            if let response = response  {
//                (error == nil) ? self.presenter?.responseGetPokemonFromInteractor(with: response) : self.presenter?.errorToGetPokemon()
//            }else { return }
//        }
    }
    
    //MARK: - G E T · C H A I N · E V O L U T I O N
    func getEvolution(of idPokemon: String) {
//        PokeServicesProvider.shared.getChainEvolution(of: idPokemon) { response, error in
//            if let response  = response  {
//                (error == nil) ? self.presenter?.responseGetPokeEvolutionFromInteractor(with: response) : self.presenter?.errorToGetEvolution()
//            }else {return}
//        }
    }
    
    //MARK: - G E T · P O K E M O N · S P E C I E S
    func getPokeSpecies(with idPokemon: String) {
//        PokeServicesProvider.shared.getPokemonSpecies(of: idPokemon) { response, error in
//            if let response  = response  {
//                (error == nil) ? self.presenter?.responseGetPokeSpeciesFromInteractor(with: response) : self.presenter?.errorToGetSpecies()
//            }else {return}
//        }
    }
}
