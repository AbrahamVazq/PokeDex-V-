//  mainAllPokemonViewController.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class mainAllPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var lblNamePokemon: UILabel!
    @IBOutlet weak var lblNoPokemon: UILabel!
    @IBOutlet weak var lblTypeOne: UILabel!
    @IBOutlet weak var lblTypeTwo: UILabel!
    @IBOutlet weak var txtVDescription: UITextView!
    @IBOutlet weak var cvSprites: UICollectionView!
    @IBOutlet weak var tblAllPokemon: UITableView!
    @IBOutlet weak var vwEvolution: UIView!
    @IBOutlet weak var vwInformation: UIView!
    
    //MARK: - P R O P E R T I E S
    var presenter: mainAllPokemon_ViewToPresenterProtocol?
    var allPokemon: [Pokemon_entries] = []
    var arrSprites: [String] = []
    var arrEvolSprites: [String] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDelegates()
        PokeLoader.shared.show(in: self.view)
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.presenter?.getPokeSpecies(of: "1")
    }
    
    func setUpDelegates(){
        self.tblAllPokemon.delegate = self
        self.tblAllPokemon.dataSource = self
        self.tblAllPokemon.separatorStyle = .none
        self.tblAllPokemon.register(SimpleTableViewCell.nib, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        self.cvSprites.delegate = self
        self.cvSprites.dataSource = self
        self.cvSprites.register(MainSpriteCollectionViewCell.nib, forCellWithReuseIdentifier: MainSpriteCollectionViewCell.identifier)
    }
    
    func updateMainView(with pokemon: Pokemon){
        self.arrSprites = []
        self.vwInformation.backgroundColor = .PRed
        self.lblNamePokemon.text = pokemon.name?.capitalized
        self.lblNamePokemon.textColor = .PYellow
        self.lblNoPokemon.text = "# \(pokemon.id ?? 0)"
        self.lblNoPokemon.textColor = .PYellow
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
        self.setUpTypes(with: pokemon)
    }
    
    func setUpTypes(with pokemon: Pokemon) {
        var arrTypes: [String] = []
        for e in pokemon.types ?? [] { arrTypes.append(e.type?.name ?? "") }
        if arrTypes.count == 2 {
            self.lblTypeTwo.isHidden = false
            self.lblTypeOne.text = arrTypes[0]
            self.lblTypeTwo.text = arrTypes[1]
        }else{
            self.lblTypeOne.text = arrTypes[0]
            self.lblTypeTwo.isHidden = true
        }
        PokeLoader.shared.hide()
    }
    
    func setEvolutionView(with evolutions: PokeEvolution){
        let evolutionView = Evolution3StepsView.instantiate(with: NSObject())
        self.vwEvolution.addSubview(evolutionView)
        
        evolutionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [evolutionView.leadingAnchor.constraint(equalTo: vwEvolution.leadingAnchor),
             evolutionView.trailingAnchor.constraint(equalTo: vwEvolution.trailingAnchor),
             evolutionView.topAnchor.constraint(equalTo: vwEvolution.topAnchor),
             evolutionView.bottomAnchor.constraint(equalTo: vwEvolution.bottomAnchor),
            ]
        )
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension mainAllPokemonViewController: mainAllPokemon_PresenterToViewProtocol {

    
}
