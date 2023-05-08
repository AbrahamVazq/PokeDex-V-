//  mainAllPokemonViewController.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class mainAllPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var lblNamePokemon: UILabel!
    @IBOutlet weak var lblNoPokemon: UILabel!
    @IBOutlet weak var txtVDescription: UITextView!
    @IBOutlet weak var cvSprites: UICollectionView!
    @IBOutlet weak var tblAllPokemon: UITableView!
    
    //MARK: - P R O P E R T I E S
    var presenter: mainAllPokemon_ViewToPresenterProtocol?
    var allPokemon: [Pokemon_entries] = []
    var arrSprites: [String] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDelegates()
        self.presenter?.viewDidLoad()
    }
    
    func setUpDelegates(){
        self.tblAllPokemon.delegate = self
        self.tblAllPokemon.dataSource = self
        self.tblAllPokemon.register(SimpleTableViewCell.nib, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        self.cvSprites.delegate = self
        self.cvSprites.dataSource = self
        self.cvSprites.register(MainSpriteCollectionViewCell.nib, forCellWithReuseIdentifier: MainSpriteCollectionViewCell.identifier)
    }
    
    func updateMainView(with pokemon: Pokemon){
        self.arrSprites = []
        self.lblNamePokemon.text = pokemon.name?.capitalized
        self.lblNoPokemon.text = "# \(pokemon.id ?? 0)"
        self.setUpSprites(with: pokemon)
    }
    
    func setUpSprites(with pokemon: Pokemon) {
        if pokemon.sprites?.other?.home?.front_default != nil {
            arrSprites.append(pokemon.sprites?.other?.home?.front_default ?? "")
        }
        if pokemon.sprites?.other?.home?.front_shiny != nil {
            arrSprites.append(pokemon.sprites?.other?.home?.front_shiny ?? "")
        }
    
        cvSprites.reloadData()
    }
    
}

// MARK: - P R E S E N T E R · T O · V I E W
extension mainAllPokemonViewController: mainAllPokemon_PresenterToViewProtocol {
    func updatePokemonError() {
        print(" E R R O R ")
    }
    
    func updatePokemon(with pokemon: Pokemon) {
        self.updateMainView(with: pokemon)
    }
        
    func updateView(with entries: [Pokemon_entries]) {
        self.allPokemon = entries
        self.tblAllPokemon.reloadData()
    }
    
    func updateViewError(with entries: [Pokemon_entries]) {
        print(" E R R O R ")
    }
    
}
