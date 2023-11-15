//  PokeServicesManager.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 04/09/23.

import Foundation

protocol NetworkAPIProtocol: AnyObject {
    var urlConfiguration: PokeURLConfiguration { get set }
    func launchService<T:Decodable>(withCompletionHandler handler: @escaping(Result <T,ErrorNetwork>) -> Void)
}

class PokeServicesManager: NetworkAPIProtocol {
    var urlConfiguration: PokeURLConfiguration
    
    init(urlConfiguration: PokeURLConfiguration) {
        self.urlConfiguration = urlConfiguration
    }
    
    public func launchService<T>(withCompletionHandler handler: @escaping(Result <T, ErrorNetwork>) -> Void) where T : Decodable {
        guard let url = urlConfiguration.configureURL() else {
            handler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: .init(url: url)) { data, response, _ in
            guard let data = data, let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                handler(.failure(.badResponse))
                return 
            }
            
            if let json = try? JSONDecoder().decode(T.self, from: data) {
                handler(.success(json))
            } else {  handler(.failure(.badJSON)) }
        }.resume()
    }
}
