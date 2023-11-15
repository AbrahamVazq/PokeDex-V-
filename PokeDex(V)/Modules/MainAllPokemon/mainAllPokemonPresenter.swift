//  mainAllPokemonPresenter.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class mainAllPokemonPresenter: mainAllPokemon_ViewToPresenterProtocol {
    
    weak var view: mainAllPokemon_PresenterToViewProtocol?
    var interactor: mainAllPokemon_PresenterToInteractorProtocol?
    var router: mainAllPokemon_PresenterToRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getAllPokemon()
    }
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension mainAllPokemonPresenter: mainAllPokemon_InteractorToPresenterProtocol {
    
    func responseGetPokesFromInteractor(with entries: [Pokemon_entries]) {
        view?.updateView(with: entries)
    }

    func errorToGetPokemon(with error: ErrorNetwork) {
        print("\n\n\n error --->>> \(error) \n\n\n")
    }

}
