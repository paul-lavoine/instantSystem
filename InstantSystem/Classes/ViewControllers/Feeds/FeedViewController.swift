//
//  FeedViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Rswift

class FeedViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private (set) weak var tableView: UITableView!
    
    // MARK: - Properties
    let feedViewModel: FeedViewModel
    let titleFeed: String?
    
    // MARK: - Constructors
    required init(with coordinator: FeedCoordinator, feedController: FeedController) {
        self.feedViewModel = FeedViewModel(with: coordinator, feedController: feedController)
        titleFeed          = feedController.feed?.title
        
        super.init(nibName: R.nib.feedViewController.name, bundle: R.nib.feedViewController.bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(R.nib.feedCell)
        
        title = titleFeed
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.numberOfPost()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.feedCell, for: indexPath) else {
            fatalError("Cannot dequeue cell with <\(R.reuseIdentifier.feedCell)> identifier")
        }
        
        if let post: Post = feedViewModel.post(at: indexPath.row) {
            cell.configure(with: post)
        }
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        feedViewModel.didSelectItem(at: indexPath.row)
    }
}
