import UIKit

class ReportIssueVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var charcover: UILabel!
    @IBOutlet weak var lettersexcced: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var lettersnum: UILabel!
    @IBAction func submitbutton(_ sender: UIButton) {
        let successPopUp = SuccessPopUp()
        successPopUp.appear(sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charcover.isHidden = true

        textArea.delegate = self
        textArea.layer.cornerRadius = 20
        textArea.text = NSLocalizedString("Tell-us-your-issue", comment: "")
        textArea.textColor = UIColor.lightGray
        
        submitButton.setTitle(NSLocalizedString("Submit", comment: ""), for: .normal)
        
        if let titleLabel = submitButton.titleLabel {
            let boldFont = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
            submitButton.titleLabel?.font = boldFont
        }
        
        updateSubmitButtonState()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
        }
        
        updateSubmitButtonState()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
        }
        
        updateSubmitButtonState()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateSubmitButtonState()
    }
    
    func updateSubmitButtonState() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com

}
