
import UIKit

class PostVCell: UITableViewCell {

    @IBOutlet weak var timeStamplbl: UILabel!
    @IBOutlet weak var PostCaption: UILabel!
    @IBOutlet weak var PostImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCornerGradient()
    }

    func applyCornerGradient(){
        PostImageView.layer.cornerRadius = 16

        let gradient = CAGradientLayer()
        gradient.frame = PostImageView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0,1, 1.0]
        let containerView = UIView(frame: PostImageView.bounds)
        containerView.layer.addSublayer(gradient)
        PostImageView.addSubview(containerView)
    }
}
