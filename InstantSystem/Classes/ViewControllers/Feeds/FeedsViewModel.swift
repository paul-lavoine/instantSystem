//
//  FeedsViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class FeedsViewModel {
    
    // MARK: - Properties
    private var coordinator: FeedsCoordinator
    var feedsController: FeedsController
    
    // MARK: - Constructor
    init(with coordinator: FeedsCoordinator, feedsController: FeedsController) {
        self.coordinator     = coordinator
        self.feedsController = feedsController
    }
    
    // MARK: - Navigation
    func didSelectItem(at index: Int) {
        if let post: Post = feedsController.feed?.posts[index] {
            coordinator.show(post)
        }
    }
    
    // MARK: - Tools
    func post(at index: Int) -> Post? {
        return feedsController.feed?.posts[index]
    }
    
    func numberOfPost() -> Int {
        return feedsController.feed?.posts.count ?? 0
    }
}
