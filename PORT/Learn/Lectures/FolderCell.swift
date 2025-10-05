
import UIKit

class FolderCell: UITableViewCell {

    @IBOutlet weak var folderBackground: UIView!
    @IBOutlet weak var folderlabel: UILabel!
    @IBOutlet weak var folderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        folderView.layer.cornerRadius = 20
        folderBackground.layer.cornerRadius = 8
        
    }
    
    

}
