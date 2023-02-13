//  PokeExtension.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.


import UIKit

//MARK: - UI · T A B L E · V I E W · C E L L
public extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: .main) }
}
