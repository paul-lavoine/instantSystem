//
//  FeedDetailViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import UIKit
import Rswift

class FeedDetailViewController: UIViewController {
    
    // MARK: - Constructors
    required init(with feedsController: FeedsController) {
        super.init(nibName: R.nib.feedDetailViewController.name, bundle: R.nib.feedDetailViewController.bundle)
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
