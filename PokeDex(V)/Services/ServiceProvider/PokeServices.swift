//  PokeServices.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.

import Foundation
import Alamofire

final class PokeServicesProvider {
    
    //MARK: - B L O C K
    public typealias blkGetAllPokemon     = (PokedexNational?, AFError?) -> Void
    public typealias blkGetFirstSprite    = (Pokemon?, AFError?) -> Void
    public typealias blkGetPokeSpecies    = (PokeSpecies?, AFError?) -> Void
    public typealias blkGetChainEvolution = (PokeEvolution?, AFError?) -> Void
    
    
    //MARK: - V A R I A B L E S
    static let shared = PokeServicesProvider()
    private let urlAllPokemon = "https://pokeapi.co/api/v2/pokedex/1/"
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
    
    func getSprites(of idPokemon:String = "1", withHandler: @escaping blkGetFirstSprite){
        let urlForSprites:String = "https://pokeapi.co/api/v2/pokemon/\(idPokemon)"
        AF.request(urlForSprites,method: .get).validate(statusCode: okStatus).responseDecodable(of: Pokemon.self) { response in
            switch response.result {
            case .success(let value):
                withHandler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
            }
        }
    }
    
    func getChainEvolution(of idPokemon:String = "1", withHandler: @escaping blkGetChainEvolution) {
        let urlForEvolution:String = "https://pokeapi.co/api/v2/evolution-chain/\(idPokemon)/"
        AF.request(urlForEvolution, method: .get).validate(statusCode: okStatus).responseDecodable(of: PokeEvolution.self) { response in
            switch response.result {
            case .success(let value):
                withHandler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
            }
        }
    }
    
    func getPokemonSpecies(of idPokemon: String = "1", withHandler: @escaping blkGetPokeSpecies) {
        let urlForSpceies:String = "https://pokeapi.co/api/v2/pokemon-species/\(idPokemon)/"
        AF.request(urlForSpceies, method: .get).validate(statusCode: okStatus).responseDecodable(of: PokeSpecies.self) { response in
            switch response.result {
            case .success(let value):
                withHandler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? withHandler(nil,nil) : withHandler(nil,error)
            }
        }
    }
    
    func consultService<T: Decodable>(of idPokemon:String = "1", forEndPoint strUrl:PokePaths, withHandler handler: @escaping (T?, AFError?) -> Void ) {
        guard let url = URL(string: strUrl.getPokePath()) else { return }
        AF.request(url, method: .get).validate(statusCode: okStatus).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                response.response?.statusCode == 200 ? handler(nil,nil) : handler(nil,error)
            }
        }
    }
    
}
