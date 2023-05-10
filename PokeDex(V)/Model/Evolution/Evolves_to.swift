import Foundation

struct Evolves_to : Codable {
	let evolution_details : [Evolution_details]?
	let evolves_to : [Evolves_to]?
	let is_baby : Bool?
	let species : Species?
}
