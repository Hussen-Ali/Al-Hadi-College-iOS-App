import UIKit
import GoogleSignIn
import KeychainSwift
class LoginVC: UIViewController {
    let keychain = KeychainSwift()
    @IBAction func btnSign(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text = NSLocalizedString("l1", comment: "")
        lbl2.text = NSLocalizedString("l2", comment: "")
        btnsig.setTitle (NSLocalizedString("l3", comment: ""), for: .normal)
    }
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var btnsig: UIButton!
}
