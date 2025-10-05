
import UIKit

class StatusCell: UITableViewCell {

    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var desclabel: UILabel!
    @IBOutlet weak var statuslabel: UILabel!
    @IBOutlet weak var statusview: UIView!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var studentname: UILabel!
    @IBOutlet weak var studentimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellview.clipsToBounds = true
        statusview.clipsToBounds = true
        cellview.layer.cornerRadius = 20
        statusview.layer.cornerRadius = 16.5
        studentimage.layer.cornerRadius = (studentimage.frame.width) / 2
        //.layer.masksToBounds = false
        
    }


}
