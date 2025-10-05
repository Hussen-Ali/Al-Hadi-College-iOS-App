import UIKit

class BillsCell: UITableViewCell {

    @IBOutlet weak var circularProgressView: CircularProgres!
    @IBOutlet weak var paidcell: UILabel!
    @IBOutlet weak var remaincell: UILabel!
    @IBOutlet weak var datecell: UILabel!
    @IBOutlet weak var customView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(datearg: String, paidarg: Int, remainarg: Int) {
        circularProgressView.layer.cornerRadius = 50
        
        datecell.text = datearg
        paidcell.text = "\(paidarg)"
        remaincell.text = "\(remainarg)"
        
        backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 247/255.0, alpha: 1.0)
        customView.backgroundColor = UIColor.white
        customView.layer.cornerRadius = 25
        customView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
