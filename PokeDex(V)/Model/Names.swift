

import Foundation
struct Names : Codable {
	let language : Language?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case language = "language"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		language = try values.decodeIfPresent(Language.self, forKey: .language)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
