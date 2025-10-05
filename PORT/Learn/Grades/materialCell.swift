
import UIKit

class materialCell: UITableViewCell {
    
    @IBOutlet weak var isCarry: UILabel!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var materialDegree: UILabel!
    @IBOutlet weak var materialName: UILabel!
    @IBOutlet weak var cellContent: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        content.clipsToBounds = true
        content.layer.cornerRadius = 16
//        content.layer.shadowColor = UIColor.black.cgColor
//        content.layer.shadowOpacity = 0.05
//        content.layer.shadowOffset = CGSize(width: 0, height: 4)
//        content.layer.shadowRadius = 3
        content.layer.masksToBounds = false
        
    }
    
    
    
}
