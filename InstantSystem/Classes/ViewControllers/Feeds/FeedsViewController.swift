//
//  FeedsViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Rswift

class FeedsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private (set) weak var tableView: UITableView!
    
    // MARK: - Properties
    let feedsViewModel: FeedsViewModel
    let titleFeed: String?
    
    // MARK: - Constructors
    required init(with coordinator: FeedsCoordinator, feedsController: FeedsController) {
        self.feedsViewModel = FeedsViewModel(with: coordinator, feedsController: feedsController)
        titleFeed           = feedsController.feed?.title
        
        super.init(nibName: R.nib.feedsViewController.name, bundle: R.nib.feedsViewController.bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FeedsCell.nib(), forCellReuseIdentifier: FeedsCell.reuseIdentifier())

        title = titleFeed
    }
}

extension FeedsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsViewModel.numberOfPost()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedsCell.reuseIdentifier(), for: indexPath) as? FeedsCell else {
            fatalError("Cannot dequeue cell with <\(FeedsCell.reuseIdentifier())> identifier")
        }

        if let post: Post = feedsViewModel.post(at: indexPath.row) {
            cell.configure(with: post)
        }
        
        return cell
    }
}

extension FeedsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        feedsViewModel.didSelectItem(at: indexPath.row)
    }
}
