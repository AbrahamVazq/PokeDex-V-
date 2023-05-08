//  mainAllPokemonViewController.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class mainAllPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var tblAllPokemon: UITableView!{
        didSet{
            self.tblAllPokemon.delegate = self
            self.tblAllPokemon.dataSource = self
            self.tblAllPokemon.register(SimpleTableViewCell.nib, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        }
    }
    
    
    //MARK: - P R O P E R T I E S
    var presenter: mainAllPokemon_ViewToPresenterProtocol?
    var allPokemon: [Pokemon_entries] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    func updateMainView(with pokemon: Pokemon){
        
    }
    
    
}

// MARK: - P R E S E N T E R · T O · V I E W
extension mainAllPokemonViewController: mainAllPokemon_PresenterToViewProtocol {
    func updatePokemonError() {
        print("ERROR")
    }
    
    func updatePokemon(with pokemon: Pokemon) {
        print("\n\n\n Pokemon --->>>  \(pokemon) \n\n\n")
        
    }
        
    func updateView(with entries: [Pokemon_entries]) {
        self.allPokemon = entries
        self.tblAllPokemon.reloadData()
    }
    
    func updateViewError(with entries: [Pokemon_entries]) {
        print("Esto me llego desde el presenter: \(entries)")
        print("ERROR")
    }
    
}
