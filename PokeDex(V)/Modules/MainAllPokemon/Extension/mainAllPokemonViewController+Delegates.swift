//
//  mainAllPokemonViewController+Delegates.swift
//  PokeDex(V)
//
//  Created by Abraham Vazquez on 27/04/23.
//

import UIKit

extension mainAllPokemonViewController: UITableViewDelegate {
    
}

extension mainAllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
