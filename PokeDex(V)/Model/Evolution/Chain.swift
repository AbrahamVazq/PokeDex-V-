import Foundation

struct Chain : Codable {
	let evolution_details : [String]?
	let evolves_to : [Evolves_to]?
	let is_baby : Bool?
	let species : Species?
}
