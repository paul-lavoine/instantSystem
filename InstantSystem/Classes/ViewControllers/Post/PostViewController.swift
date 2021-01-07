//
//  PostViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Rswift

class PostViewController: UIViewController {
    
    // MARK: - Constructors
    required init(with feedsCoordinator: FeedsCoordinator, post: Post) {
        super.init(nibName: R.nib.postViewController.name, bundle: R.nib.postViewController.bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not instantiate this view controller from xib")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
