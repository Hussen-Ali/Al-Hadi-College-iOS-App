
import UIKit

class SuccessPopUp: UIViewController {

    @IBOutlet weak var doneoutlet: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBAction func doneaction(_ sender: UIButton) {
        hide()
    }
    init() {
            super.init(nibName: "SuccessPopUp", bundle: nil)
            self.modalPresentationStyle = .overFullScreen
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

            configView()
        }
        
        private func configView() {
            self.view.backgroundColor = .clear
            self.backView.backgroundColor = .black.withAlphaComponent(0.6)
            self.backView.alpha = 0
            self.contentView.alpha = 0
            self.contentView.layer.cornerRadius = 15
            self.doneoutlet.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
        }
        
        func appear(sender: ReportIssueVC) {
            sender.present(self, animated: false) {
                self.show()
            }
        }
        
    private func show() {
        backView.alpha = 0
        backView.transform = CGAffineTransform(scaleX: 1, y: 1)
        contentView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        contentView.alpha = 0

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseInOut) {
            self.contentView.transform = .identity
            self.contentView.alpha = 1
        }

        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.backView.alpha = 1
        })
    }

        
        func hide() {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0
                self.contentView.alpha = 0
            } completion: { _ in
                self.dismiss(animated: false)
                self.removeFromParent()
            }
        }


}
