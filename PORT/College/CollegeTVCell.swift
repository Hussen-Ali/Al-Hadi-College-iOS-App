//
//  CollegeTVCell.swift
//  PORT
//
//  Created by hussein ali on 09/07/2023.
//

import UIKit

class CollegeTVCell: UITableViewCell {
    @IBOutlet weak var CardContentV: UIView!
    @IBOutlet weak var CardCaption: UILabel!
    @IBOutlet weak var CardImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCornerGradient()
        
    }

        
    func applyCornerGradient(){
        CardImageView.layer.cornerRadius = 16
        CardContentV.layer.cornerRadius = 16
//        CardContentV.layer.borderWidth = 1.0
//        CardContentV.layer.borderColor = UIColor.black.cgColor
        
        
        let gradient = CAGradientLayer()
        gradient.frame = CardImageView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.3,1, 1.0]
        let containerView = UIView(frame: CardImageView.bounds)
        containerView.layer.addSublayer(gradient)
        CardImageView.addSubview(containerView)
    }
    
}
