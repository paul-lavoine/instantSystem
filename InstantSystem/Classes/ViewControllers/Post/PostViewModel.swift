//
//  PostViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class PostViewModel {
    
    // MARK: - Properties
    var post: Post
    private var coordinator: FeedsCoordinator
    
    // MARK: - Constructor
    init(with coordinator: FeedsCoordinator, post: Post) {
        self.post        = post
        self.coordinator = coordinator
    }
}
