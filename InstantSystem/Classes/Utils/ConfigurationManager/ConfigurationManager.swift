//
//  ConfigurationManager.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

class ConfigurationManager {
    // MARK: - Consts
    struct Consts {
        static let filename = "configuration.json"
    }

    // MARK: - Constructors
    private init() {}

    // MARK: - Static constructor
    static func mainConfiguration() -> Configuration {
        // Locate file in main bundle
        guard let fileUrl = Bundle.main.url(forResource: Consts.filename, withExtension: nil) else {
            fatalError("Cannot load configuration file. Please check format")
        }

        // Try to load configuration from json file
        do {
            let json = try Data(contentsOf: fileUrl)
            let configuration = try JSONDecoder().decode(Configuration.self, from: json)

            return configuration
        } catch {
            // Decoding error
            fatalError("\(error)")
        }
    }
}
