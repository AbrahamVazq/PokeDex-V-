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
        
    }
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension mainAllPokemonPresenter: mainAllPokemon_InteractorToPresenterProtocol {

    

}
