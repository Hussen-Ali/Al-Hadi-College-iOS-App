import UIKit

class PostDetailsVC: UIViewController {
    
    var post: APIResponse?
    @IBOutlet weak var Captionlabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func viewDidLoad() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
