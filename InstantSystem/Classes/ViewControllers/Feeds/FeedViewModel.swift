//
//  FeedViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class FeedViewModel {
    
    // MARK: - Properties
    private var coordinator: FeedCoordinator
    var feedController: FeedController
    
    // MARK: - Constructor
    init(with coordinator: FeedCoordinator, feedController: FeedController) {
        self.coordinator     = coordinator
        self.feedController = feedController
    }
    
    // MARK: - Navigation
    func didSelectItem(at index: Int) {
        if let post: Post = feedController.feed?.posts[index] {
            coordinator.show(post)
        }
    }
    
    // MARK: - Tools
    func post(at index: Int) -> Post? {
        return feedController.feed?.posts[index]
    }
    
    func numberOfPost() -> Int {
        return feedController.feed?.posts.count ?? 0
    }
}
