

import Foundation
struct PokedexNational : Codable {
	let descriptions : [Descriptions]?
	let id : Int?
	let is_main_series : Bool?
	let name : String?
	let names : [Names]?
	let pokemon_entries : [Pokemon_entries]?
	let region : String?
	let version_groups : [String]?

	enum CodingKeys: String, CodingKey {

		case descriptions = "descriptions"
		case id = "id"
		case is_main_series = "is_main_series"
		case name = "name"
		case names = "names"
		case pokemon_entries = "pokemon_entries"
		case region = "region"
		case version_groups = "version_groups"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptions = try values.decodeIfPresent([Descriptions].self, forKey: .descriptions)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		is_main_series = try values.decodeIfPresent(Bool.self, forKey: .is_main_series)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		names = try values.decodeIfPresent([Names].self, forKey: .names)
		pokemon_entries = try values.decodeIfPresent([Pokemon_entries].self, forKey: .pokemon_entries)
		region = try values.decodeIfPresent(String.self, forKey: .region)
		version_groups = try values.decodeIfPresent([String].self, forKey: .version_groups)
	}

}
