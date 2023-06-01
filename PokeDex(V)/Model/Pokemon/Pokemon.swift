//  Pokemon.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 07/05/23.

import Foundation

struct Pokemon : Codable {
    let abilities : [Abilities]?
    let base_experience : Int?
    let forms : [Forms]?
    let game_indices : [Game_indices]?
    let height : Int?
    let held_items : [String]?
    let id : Int?
    let is_default : Bool?
    let location_area_encounters : String?
    let moves : [Moves]?
    let name : String?
    let order : Int?
    let past_types : [String]?
    let species : Species?
    let sprites : Sprites?
    let stats : [Stats]?
    let types : [Types]?
    let url : String?
    let weight : Int?
}
