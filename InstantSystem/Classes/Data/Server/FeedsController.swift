//
//  FeedController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

class FeedsController: NSObject {
    
    // MARK: - Properties
    let baseURL: URL

    // MARK: - Constructors
    init(with configuration: Configuration) {
        baseURL = configuration.server.url()
    }
}
