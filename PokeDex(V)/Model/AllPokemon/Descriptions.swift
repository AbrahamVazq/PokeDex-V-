
import Foundation

struct Descriptions : Codable {
	let description : String?
	let language : Language?

	enum CodingKeys: String, CodingKey {

		case description = "description"
		case language = "language"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		language = try values.decodeIfPresent(Language.self, forKey: .language)
	}

}
