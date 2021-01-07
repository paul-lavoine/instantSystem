//
//  FeedsViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class FeedsViewController: UIViewController {
    
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
        
        let view = feedsView()
        view.tableView.register(FeedsCell.nib(), forCellReuseIdentifier: FeedsCell.reuseIdentifier())
        view.tableView.dataSource = feedsViewModel
        view.tableView.delegate = view
        view.displayPostAt = { [weak self] indexPath in
            self?.feedsViewModel.didSelectItem(at: indexPath)
        }
        
        title = titleFeed
    }

    // MARK: - Utils
    private func feedsView() -> FeedsView {
        guard let feedsView = view as? FeedsView else {
            fatalError("<\(type(of: self.view))> found instead of expected FeedsView")
        }

        return feedsView
    }
}
