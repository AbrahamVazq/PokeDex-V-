//  mainAllPokemonViewController+Delegates.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 27/04/23.

import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E
extension mainAllPokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let idPokemon = self.allPokemon[indexPath.row].entry_number {
            print("\n\n\n idPokemon --->>> \(idPokemon) \n\n\n")
            self.view.activityStartAnimating(backgroundColor: UIColor.black.withAlphaComponent(0.5))
            self.presenter?.getSpriteOfPokemon(id: idPokemon)
        }
    }
}

//MARK: - UI · T A B L E · V I E W · D A T A S O U R C E
extension mainAllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier,
                                                 for: indexPath) as? SimpleTableViewCell ?? SimpleTableViewCell()
        cell.backgroundColor = .PBlue
        cell.lblTitle.text = "\(indexPath.row + 1) - \(allPokemon[indexPath.row].pokemon_species?.name?.capitalized ?? "")"
        return cell
    }
}

//MARK: - UI · C O L L E C T I O N · V I E W · D E L E G A T E
extension mainAllPokemonViewController: UICollectionViewDelegate{
    
}


//MARK: - UI · C O L L E C T I O N · V I E W · D A T A S O U R C E
extension mainAllPokemonViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSprites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainSpriteCollectionViewCell.identifier, for: indexPath) as? MainSpriteCollectionViewCell ?? MainSpriteCollectionViewCell()
        cCell.setSprite(withImage: arrSprites[indexPath.row])
        return cCell
    }
    
    
}
