//  mainAllPokemonProtocols.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation
/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Si queremos ir a otro modulo VIPER
 
    * goTo___________( )
    * goTo___________( _ : )
 
 Si queremos ir por datos o hacer un consumo
    * viewDidLoad()
    * getTo___________( )
    * getTo___________( _ : )
 */

// MARK: VIEW -> PRESENTER
protocol mainAllPokemon_ViewToPresenterProtocol: AnyObject {
    var view: mainAllPokemon_PresenterToViewProtocol? { get set }
    var interactor: mainAllPokemon_PresenterToInteractorProtocol? { get set }
    var router: mainAllPokemon_PresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    
    func getPokemon(of idPokemon: String)
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/**
 Sugerencias en el llamado de Funciones de  Presenter a Interactor
 :condiciones:
 
 Tratemos que la funcion se llame igual que desde la que viene en la vista al Presenter,
 pero en esta ocacion agregemosle el subfijo: 'ToInteractor', para saber que vamos
 del presenter al iintectartor
 
    * get___________ToInteractor( )
    * getTo___________ToInteractor( )
 
    * get___________ToInteractor( _ : )
    * getTo___________ToInteractor( _ : )
 
 */

// MARK: PRESENTER -> INTERACTOR
protocol mainAllPokemon_PresenterToInteractorProtocol: AnyObject {
    var presenter: mainAllPokemon_InteractorToPresenterProtocol? { get set }
    
    func getAllPokemon()
    func getPokemon(of idPokemon: String)
}


//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Tratemos que la funcion se llame igual que desde la que viene en la vista al Presenter,
 pero en esta ocacion agregemosle el subfijo: 'FromInteractor' con los parametros que correspondan,
 para saber que vamos del Interactor  al Presenter
 
    * get___________FromInteractor( )
    * getTo___________FromInteractor( )
 
    * get___________FromInteractor(_ :)
    * getTo___________FromInteractor(_ :)
 */

// MARK: INTERACTOR -> PRESENTER
protocol mainAllPokemon_InteractorToPresenterProtocol: AnyObject {
    
    func responseGetPokesFromInteractor(with entries: [Pokemon_entries])
    func errorToGetPokemon(with entries: [Pokemon_entries])
    
    func responseGetPokemonFromInteractor(with pokemon: Pokemon)
    func errorToGetPokemon()
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Tratemos de usar la funcion updateView(_ :), con los parametros que correspondan, para
 saber que vamos del Presenter a la Vista.
 
    * updateView(_: )
 
 */

// MARK: PRESENTER -> VIEW
protocol mainAllPokemon_PresenterToViewProtocol: AnyObject {
    var presenter: mainAllPokemon_ViewToPresenterProtocol? { get set }
    
    func updateView(with entries: [Pokemon_entries])
    func updateViewError(with entries: [Pokemon_entries])
    
    func updatePokemon(with pokemon: Pokemon)
    func updatePokemonError()
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Si queremos ir a otro modulo VIPER, usemos goTo_________( _ : ), con parametros si es necesario para
 asegurar que vamos del Presenter a el Router de otro Modulo VIPER.
 
    * goTo___________( _ : )
 */

// MARK: PRESENTER -> ROUTER
protocol mainAllPokemon_PresenterToRouterProtocol: AnyObject {
}
