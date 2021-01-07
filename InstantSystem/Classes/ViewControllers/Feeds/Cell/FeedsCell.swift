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
        
        let layer = gradient(frame: gradientView.bounds)
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
        postImageView.sd_setImage(with: post.imageUrl(), completed: nil)
    }
    
    // MARK: - UI Components
    func gradient(frame: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint   = CGPoint(x: 0, y: 0.7)
        return layer
    }
}
