//
//  FeedController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Moya
import XMLParsing

class FeedsController {
    
    // MARK: - Data
    var feed: Feed?
    private let backendProvider = MainBackendProvider()
    
    // MARK: - Network
    func fetchFeed(completion: @escaping (_ result: Feed) -> Void, failure: @escaping () -> Void) {
        backendProvider.request(.getFeed) { (response) in
            switch response {
            case let .success(moyaResponse):
                if moyaResponse.statusCode == 200 {
                    
                    do {
                        let fetchedFeed = try XMLDecoder().decode(Feed.self, from: moyaResponse.data)
                        self.feed = fetchedFeed
                        completion(fetchedFeed)
                        
                    } catch let error {
                        print("ERROR: FeedsController -> Parsing failed : \(error)")
                    }
                    
                } else {
                    failure()
                }
                break
            case let .failure(error):
                print("ERROR: FeedsController -> Can't fetch datas!! \(error)")
                failure()
                break
            }
        }
    }
}
