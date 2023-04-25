//  mainAllPokemonProtocols.swift
//  PokeDex(V)
//
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

// MARK: VIEW -> PRESENTER
protocol mainAllPokemon_ViewToPresenterProtocol: AnyObject {
	var view: mainAllPokemon_PresenterToViewProtocol? { get set }
	var interactor: mainAllPokemon_PresenterToInteractorProtocol? { get set }
	var router: mainAllPokemon_PresenterToRouterProtocol? { get set }
}

// MARK: PRESENTER -> INTERACTOR
protocol mainAllPokemon_PresenterToInteractorProtocol: AnyObject {
    var presenter: mainAllPokemon_InteractorToPresenterProtocol? { get set }
}

// MARK: INTERACTOR -> PRESENTER
protocol mainAllPokemon_InteractorToPresenterProtocol: AnyObject {
}

// MARK: PRESENTER -> VIEW
protocol mainAllPokemon_PresenterToViewProtocol: AnyObject {
    var presenter: mainAllPokemon_ViewToPresenterProtocol? { get set }
}

// MARK: PRESENTER -> ROUTER
protocol mainAllPokemon_PresenterToRouterProtocol: AnyObject {
}
