//  ErrorNetwork.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 18/09/23.

import Foundation

enum ErrorNetwork: Error {
    case badURL
    case badJSON
    case badResponse
    
    func getMessage() -> String {
        switch self {
        case .badURL:
            return NSLocalizedString("Hay un problema con el armado de la URL", comment: "Hay un problema con el armado de la URL")
        case .badJSON:
            return NSLocalizedString("Ocurrio un problema con el parseo del JSON", comment: "Ocurrio un problema con el parseo del JSON")
        case .badResponse:
            return NSLocalizedString("El Servicio no puede responder", comment: "El Servicio no puede responder")
        }
    }
}
