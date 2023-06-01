//  PokeSpecies.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 31/05/23.

import Foundation

struct PokeSpecies : Codable {
    let base_happiness : Int?
    let capture_rate : Int?
    let color : Color?
    let egg_groups : [Egg_groups]?
    let evolution_chain : Evolution_chain?
    let evolves_from_species : String?
    let flavor_text_entries : [Flavor_text_entries]?
    let form_descriptions : [String]?
    let forms_switchable : Bool?
    let gender_rate : Int?
    let genera : [Genera]?
    let generation : Generation?
    let growth_rate : Growth_rate?
    let habitat : Habitat?
    let has_gender_differences : Bool?
    let hatch_counter : Int?
    let id : Int?
    let is_baby : Bool?
    let is_legendary : Bool?
    let is_mythical : Bool?
    let name : String?
    let names : [Names]?
    let order : Int?
    let pal_park_encounters : [Pal_park_encounters]?
    let pokedex_numbers : [Pokedex_numbers]?
    let shape : Shape?
    let varieties : [Varieties]?
}
