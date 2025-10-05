
import UIKit

class IssueDetailVC: UIViewController {
    
 
    
    @IBOutlet weak var cellview: UIView!
  
    @IBOutlet weak var replyview: UIView!
    @IBOutlet weak var descview: UITextView!
    @IBOutlet weak var statuslabel: UILabel!
    @IBOutlet weak var statusview: UIView!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var studentname: UILabel!
    @IBOutlet weak var studentimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        cellview.clipsToBounds = true
        cellview.layer.cornerRadius = 20
        replyview.clipsToBounds = true
        replyview.layer.cornerRadius = 20
        statusview.clipsToBounds = true
        statusview.layer.cornerRadius = 16.5
        studentimage.layer.cornerRadius = (studentimage.frame.width) / 2
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }

}
