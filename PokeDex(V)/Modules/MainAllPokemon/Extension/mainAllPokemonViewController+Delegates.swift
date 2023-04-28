//  mainAllPokemonViewController+Delegates.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 27/04/23.

import UIKit

extension mainAllPokemonViewController: UITableViewDelegate {
    
}

extension mainAllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier,
                                                 for: indexPath) as? SimpleTableViewCell ?? SimpleTableViewCell()
        cell.lblTitle.text = allPokemon[indexPath.row].pokemon_species?.name
        return cell
    }
}
