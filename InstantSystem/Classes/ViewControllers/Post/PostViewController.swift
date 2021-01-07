//
//  PostViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Rswift

class PostViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: PostViewModel
    
    // MARK: - Constructors
    required init(with feedsCoordinator: FeedsCoordinator, post: Post) {
        self.viewModel = PostViewModel(with: feedsCoordinator, post: post)
        
        super.init(nibName: R.nib.postViewController.name, bundle: R.nib.postViewController.bundle)
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not instantiate this view controller from xib")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        postView().configure(with: viewModel.post)
    }
    
    // MARK: - Utils
    private func postView() -> PostView {
        guard let postView = view as? PostView else {
            fatalError("<\(type(of: self.view))> found instead of expected PostView")
        }

        return postView
    }
}

extension PostViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
