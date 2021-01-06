//
//  FeedsViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class FeedsViewModel: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    private var coordinator: FeedsCoordinator
    private var feedsController: FeedsController
    
    // MARK: - Constructor
    init(with coordinator: FeedsCoordinator, feedsController: FeedsController) {
        self.coordinator     = coordinator
        self.feedsController = feedsController
    }
    
    // MARK: - Navigation
    func didSelectItem(at indexPath: IndexPath) {
        if let post: Post = feedsController.feed?.posts[indexPath.row] {
            coordinator.show(post)
        }
    }
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsController.feed?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedsCell.reuseIdentifier(), for: indexPath) as? FeedsCell else {
            fatalError("Cannot dequeue cell with <\(FeedsCell.reuseIdentifier())> identifier")
        }

        if let post: Post = feedsController.feed?.posts[indexPath.row] {
            cell.configure(with: post)
        }
        
        return cell
    }
}
