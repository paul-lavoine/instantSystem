//
//  MainBackendAPI.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 06/01/2021.
//

import Foundation
import Moya

public enum MainBackendAPI {
    case getFeed
}

// MARK: - TargetType Protocol Implementation

extension MainBackendAPI: TargetType {
    
    public var baseURL: URL {
        return ConfigurationManager.mainConfiguration().baseURL()
    }
    
    public var path: String {
        switch self {
        case .getFeed:
            return ConfigurationManager.mainConfiguration().server.path
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getFeed:
            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .getFeed:
            return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var sampleData: Data {
        switch self {
        case .getFeed:
            return Data()
        }
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return nil
    }
}


