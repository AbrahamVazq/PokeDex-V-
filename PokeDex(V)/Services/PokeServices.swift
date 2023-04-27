//  PokeServices.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.

import Foundation
import Alamofire

final class PokeSerivesProvider {
    
    //MARK: - B L O C K
    public typealias blkGetAllPokemon = (PokedexNational?, AFError?) -> Void
    
    
    //MARK: - V A R I A B L E S
    static let shared = PokeSerivesProvider()
    
    private let urlAllPokemon = "https://pokeapi.co/api/v2/pokedex/1/"
    private let okStatus = 200 ... 299
    
    func getAllPokemon(withHandler: @escaping blkGetAllPokemon){
        let url = urlAllPokemon
        AF.request(url, method: .get).validate(statusCode: okStatus).responseDecodable(of: PokedexNational.self) { response in
//            print(response)
            switch response.result {
            case .success(let value):
                withHandler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
            }
        }
    }
    
}
