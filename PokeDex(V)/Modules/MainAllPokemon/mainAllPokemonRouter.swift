//  mainAllPokemonRouter.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class mainAllPokemonRouter {
	
    static func createModule() -> UIViewController {
        
        let view = mainAllPokemonViewController()
        let presenter = mainAllPokemonPresenter()
        let interactor = mainAllPokemonInteractor()
        let router = mainAllPokemonRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension mainAllPokemonRouter: mainAllPokemon_PresenterToRouterProtocol {
    
}
