//  PokeURLConfiguration.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 05/09/23.

import Foundation

struct PokeURLConfiguration {
    var strMethod: String
    var strHost: String
    var path: PathsProtocol
    
    private var strCurrentLocale: String {
        if #available(iOS 16.0, *) {
            return Locale.current.language.languageCode?.identifier ?? ""
        } else { return Locale.current.identifier }
    }
    
    public init(strMethod: String, strHost: String, path: PathsProtocol) {
        self.strMethod = strMethod
        self.strHost = strHost
        self.path = path
    }
    
    public func configureURL() -> URL? {
        guard !strHost.isEmpty else { return nil}
        var components = URLComponents()
        components.scheme = strMethod
        components.host = strHost
        components.path = path.strPathToUse
        return components.url
    }
}


extension String: PathsProtocol {
    var strPathToUse: String {
        return self
    }
    
    
}

protocol PathsProtocol {
    var strPathToUse: String { get }
}
