//  PokeServiceProviderProtocol.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 13/07/23.

import Foundation

protocol PokeServiceProviderProtocol: AnyObject {
    var protocolResponse: PokeServiceProviderProtocolResponse? { get set }
}

protocol PokeServiceProviderProtocolResponse: AnyObject {
    func successResult<T: Decodable>(objResponse: T?)
//    func errorResult(error: AFError?)
}
