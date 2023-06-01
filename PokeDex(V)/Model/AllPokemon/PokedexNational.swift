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
}
