
import UIKit
import LanguageManager_iOS
import GoogleSignIn
import KeychainSwift

class LoginViewController: UIViewController {
    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGestures()
        configureUI()
    }

    private func setupTapGestures() {
        languages.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(languagesTapped)))
        theme.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(themeTapped)))
        signin.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(signinTapped)))
    }
    
    private func configureUI() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func languagesTapped() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
    
    @objc func themeTapped() {
        let alertController = UIAlertController(title:"",message:NSLocalizedString("theme",comment: ""), preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .destructive)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc func signinTapped() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
        }
    }
    
    
    
    @IBOutlet weak var languages: UIView!
    @IBOutlet weak var theme: UIView!
    @IBOutlet weak var signin: UIView!
    
    
}
