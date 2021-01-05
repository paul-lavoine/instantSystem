//
//  Configuration.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import Alamofire

// MARK: - Configuration
struct Configuration: Codable {
    let server: Server
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
