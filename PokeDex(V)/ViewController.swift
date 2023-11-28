//  ViewController.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 13/02/23.

import UIKit

class ViewController: UIViewController {

    //MARK: - O U T L E T S
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewPokeInfo: UIView!
    @IBOutlet weak var tablePokemon: UITableView!
    
    var pokeEntires: [Pokemon_entries] = []
    
    /// Definir una variable de tipo protocolo
    var service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: 
                                                            PokeURLConfiguration(strMethod: "https", strHost: "pokeapi.co", path: "/api/v2/pokedex/1") )
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableConfig()
        self.getAllPokemon()
    }
    
    func setTableConfig(){
        self.tablePokemon.delegate = self
        self.tablePokemon.dataSource = self
        self.tablePokemon.register(SimpleTableViewCell.nib, forCellReuseIdentifier: SimpleTableViewCell.identifier)
    }
    
//    func setUpBackground(with type: cardType) {
//        
//        view.backgroundColor = UIColor(patternImage: type.getBackground()! )
//        switch type {
//        case .normalMonster
//            
//        }
//    }
    
    func getAllPokemon(){
        service.launchService { [weak self] (result: Result<PokedexNational, ErrorNetwork>) in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    
    }

    
}

extension ViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeEntires.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath) as? SimpleTableViewCell ?? SimpleTableViewCell()
        cell.lblTitle.text = pokeEntires[indexPath.row].pokemon_species?.name
        return cell
    }
}
