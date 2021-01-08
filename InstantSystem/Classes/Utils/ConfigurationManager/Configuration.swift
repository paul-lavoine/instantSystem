//
//  Configuration.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Alamofire

// MARK: - Configuration
struct Configuration: Codable {
    
    // MARK: - Properties
    let server: Server
}

extension Configuration {

    func baseURL() -> URL {
        return URL(string: server.scheme + "://" + server.host)!
    }
}

// MARK: - Server
struct Server: Codable {
    let host, scheme, path: String

    func url() -> URL {
        var urlComponent = URLComponents()

        urlComponent.scheme = scheme
        urlComponent.host   = host
        urlComponent.path   = path

        do {
            return try urlComponent.asURL()
        } catch {
            fatalError("Server url cannot be computed. Please check <configuration.json> content")
        }
    }
}
