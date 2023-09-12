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
    
    
    func getAllPokemon(){
//        PokeServicesProvider.shared.getAllPokemon { response, error in
//            self.pokeEntires = response?.pokemon_entries ?? []
//            print("\n\n\n\n\n\n\n\n pokeEntries -> \(self.pokeEntires) \n\n\n\n\n\n\n\n")
//            self.tablePokemon.reloadData()
//        }
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
