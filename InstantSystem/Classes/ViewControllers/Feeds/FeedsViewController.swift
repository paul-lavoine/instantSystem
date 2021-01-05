//
//  FeedsViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class FeedsViewController: UIViewController {
    // MARK: - Constructors
    required init(with feedsController: FeedsController) {
        super.init(nibName: R.nib.feedsViewController.name, bundle: R.nib.feedsViewController.bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
