//
//  CatgTableView.swift
//  PORT
//
//  Created by hussein ali on 08/07/2023.
//

import UIKit

class CatgTVCell: UITableViewCell {

    @IBOutlet weak var CatgContentView: UIView!
    @IBOutlet weak var CatgLogo: UIImageView!
    @IBOutlet weak var Catglabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //CatgContentView.clipsToBounds = true
        CatgContentView.layer.cornerRadius = 8
        CatgContentView.layer.shadowColor = UIColor.black.cgColor
        CatgContentView.layer.shadowOpacity = 0.05
        CatgContentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        CatgContentView.layer.shadowRadius = 4

    }



}
