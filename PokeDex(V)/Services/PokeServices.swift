//  PokeServices.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.

import Foundation
import Alamofire

final class PokeSerivesProvider {
    
    //MARK: - B L O C K
    public typealias blkGetAllPokemon = (PokedexNational?, AFError?) -> Void
    public typealias blkGetFirstSprite = (Sprites?, AFError) -> Void
    
    
    //MARK: - V A R I A B L E S
    static let shared = PokeSerivesProvider()
    
    private let urlAllPokemon = "https://pokeapi.co/api/v2/pokedex/1/"
    private let urlForSprites = "https://pokeapi.co/api/v2/pokemon/1"
    private let okStatus = 200 ... 299
    
    func getAllPokemon(withHandler: @escaping blkGetAllPokemon){
        let url = urlAllPokemon
        AF.request(url, method: .get).validate(statusCode: okStatus).responseDecodable(of: PokedexNational.self) { response in
            switch response.result {
            case .success(let value):
                withHandler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
            }
        }
    }
    
    
    func getFirstSprite(withHandler: @escaping blkGetAllPokemon){
        AF.request(urlForSprites,method: .get).validate(statusCode: okStatus).responseDecodable(of: Sprites.self) { response in
//            switch response.result {
//            case .success(let value):
//                withHandler(value, nil)
//            case .failure(let error):
//                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
//            }
        }
    }
    
}
