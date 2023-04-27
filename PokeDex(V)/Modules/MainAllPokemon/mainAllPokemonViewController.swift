//  mainAllPokemonViewController.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class mainAllPokemonViewController: UIViewController {

    var presenter: mainAllPokemon_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension mainAllPokemonViewController: mainAllPokemon_PresenterToViewProtocol {
}
