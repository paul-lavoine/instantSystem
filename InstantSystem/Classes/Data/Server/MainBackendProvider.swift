//
//  MainBackendProvider.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 06/01/2021.
//

import Foundation
import Moya

open class MainBackendProvider: MoyaProvider<MainBackendAPI> {
    
    public override init(endpointClosure: @escaping MoyaProvider<MainBackendAPI>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                         requestClosure: @escaping MoyaProvider<MainBackendAPI>.RequestClosure = MoyaProvider<MainBackendAPI>.defaultRequestMapping,
                         stubClosure: @escaping MoyaProvider<MainBackendAPI>.StubClosure = MoyaProvider.neverStub,
                         callbackQueue: DispatchQueue? = nil,
                         session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                         plugins: [PluginType] = [MainBackendProvider.defaultCredentialsPlugin()],
                         trackInflights: Bool = false) {
        
        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   session: session,
                   plugins: plugins,
                   trackInflights: trackInflights)
    }

    public static func defaultCredentialsPlugin() -> CredentialsPlugin {
        return CredentialsPlugin { _ -> URLCredential? in
            return URLCredential()
        }
    }
}
