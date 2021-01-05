//
//  CommunicationViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Rswift

class CommunicationViewController: UIViewController {
    
    // MARK: - Constructors
    required init(with feedsController: FeedsController) {
        super.init(nibName: R.nib.communicationViewController.name, bundle: R.nib.communicationViewController.bundle)
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
