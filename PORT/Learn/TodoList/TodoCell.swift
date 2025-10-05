
import UIKit
import CoreData

class TodoCell: UITableViewCell {

    @IBAction func ischecked(_ sender: UIButton) {
        guard let labelText = textlabel.text else { return }
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        
    }
    @IBOutlet weak var threedots: UIButton!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var todoView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        todoView.layer.cornerRadius = 16
    }

}
