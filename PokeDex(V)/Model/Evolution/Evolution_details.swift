import Foundation

struct Evolution_details : Codable {
	let gender : String?
	let held_item : String?
	let item : String?
	let known_move : String?
	let known_move_type : String?
	let location : String?
	let min_affection : String?
	let min_beauty : String?
	let min_happiness : String?
	let min_level : Int?
	let needs_overworld_rain : Bool?
	let party_species : String?
	let party_type : String?
	let relative_physical_stats : String?
	let time_of_day : String?
	let trade_species : String?
	let trigger : Trigger?
	let turn_upside_down : Bool?
}
