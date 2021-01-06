//
//  FeedsCell.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 06/01/2021.
//

import UIKit
import SDWebImage

class FeedsCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private (set) weak var titleLabel: UILabel!
    @IBOutlet private (set) weak var postImageView: UIImageView!
    @IBOutlet private (set) weak var gradientView: UIView!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// Gradient
        let layer = CAGradientLayer()
        layer.frame = gradientView.frame
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientView.layer.addSublayer(layer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.image = nil
        titleLabel.text     = nil
    }
    
    // MARK: - Configuration
    func configure(with post: Post) {
        /// title
        titleLabel.text = post.title
        
        /// image
        if let url = URL(string: post.image.url) {
            postImageView.sd_setImage(with: url, completed: nil)
        }
    }
}
