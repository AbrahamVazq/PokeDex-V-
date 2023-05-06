

import Foundation
struct Pokemon_entries : Codable {
	let entry_number : Int?
	let pokemon_species : Pokemon_species?

	enum CodingKeys: String, CodingKey {

		case entry_number = "entry_number"
		case pokemon_species = "pokemon_species"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		entry_number = try values.decodeIfPresent(Int.self, forKey: .entry_number)
		pokemon_species = try values.decodeIfPresent(Pokemon_species.self, forKey: .pokemon_species)
	}

}
