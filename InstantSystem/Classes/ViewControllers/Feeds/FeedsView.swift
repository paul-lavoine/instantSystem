//
//  FeedsView.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class FeedsView: UIView, UITableViewDelegate {
    
    // MARK: Outlets
    @IBOutlet private (set) weak var tableView: UITableView!
    
    // MARK: - Callbacks
    var displayPostAt: ((IndexPath) -> Void)?
    
    // MARK: - View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - UITableViewDelegate methods
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let displayPostAt = displayPostAt {
            displayPostAt(indexPath)
        }
    }
}
