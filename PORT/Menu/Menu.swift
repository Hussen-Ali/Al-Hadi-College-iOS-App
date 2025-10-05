import UIKit
import LanguageManager_iOS
import GoogleSignIn
import KeychainSwift
class StudentProfile: UIViewController {
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let accessToken = "\(keychain.get("accesstoken") ?? "nil")"
        //print(accessToken)
        if UIScreen.main.bounds.height < 900 {
            studentconstrain.constant = 650
        }
        setupTapGestures()
        configureUI()
        retrieveDataFromUserDefaults()
    }

    private func setupTapGestures() {
        support.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(supportTapped)))
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
    private func configureUI() {
        [personalinfo, secondaryinfo, universityinfo, docs, bills, signout, theme, languages, studentid].forEach {
            $0?.layer.shadowColor = UIColor.black.cgColor
            $0?.layer.shadowOpacity = 0.05
            $0?.layer.shadowOffset = CGSize(width: 0, height: 3)
            $0?.layer.shadowRadius = 3
            $0?.layer.cornerRadius = 30
        }
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
    private func retrieveDataFromUserDefaults() {
        let namestring = UserDefaults.standard.string(forKey: "namedata") ?? NSLocalizedString("nodata", comment: "")
        let emailstring = UserDefaults.standard.string(forKey: "emaildata") ?? NSLocalizedString("nodata", comment: "")
        let imageurl = UserDefaults.standard.string(forKey: "imageurl") ?? "null"
        let imgStrToUrl = URL(string: imageurl)!
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        task.resume()
        
        StudentEmail.text = emailstring
        StudentName.text = namestring
    }
    
    let supportVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SupportVC")
    let personalInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonalInfoVC")
    let secondarySchoolVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondarySchoolVC")
    let universityInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UniversityInfoVC")
    let StudentDocsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DocsVC")
    let sidVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IDVC")
    let BillsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BillsVC")
    
    @objc func supportTapped() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func personalInfoTapped() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func secondaryinfoTapped() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func universityinfoTapped() {
        let backButton = UIBarButtonItem()
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    @objc func docsTapped() {
        navigationController?.pushViewController(StudentDocsVC, animated: true)
    }
    @objc func billsTapped() {
        BillsVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(BillsVC, animated: true)
    }
    @objc func idTapped() {
        sidVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(sidVC, animated: true)
    }
    
    // MARK: - Language
    @objc func languagesTapped() {
        //        let currentLang = Locale.current.languageCode
        //        let newLang = currentLang == "en" ? "ar" : "en"
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        present(alertController, animated: true)
    }
    
    
    @objc func themeTapped() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        
        present(alertController, animated: true)
    }
    @objc func signoutTapped() {
        self.view.shake()
        let alertController = UIAlertController(title: NSLocalizedString("confirmsignout", comment: ""), message: NSLocalizedString("confirmsignouttitle", comment: ""), preferredStyle: .alert)
        
        let signOutAction = UIAlertAction(title: NSLocalizedString("confirm", comment: ""), style: .destructive) { (action) in
            GIDSignIn.sharedInstance.signOut()
            self.keychain.delete("accesstoken")
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var StudentEmail: UILabel!
    @IBOutlet weak var StudentName: UILabel!
    @IBOutlet weak var StudentImage: UIImageView!
    @IBOutlet weak var personalinfo: UIButton!
    @IBOutlet weak var secondaryinfo: UIView!
    @IBOutlet weak var universityinfo: UIView!
    @IBOutlet weak var sid: UIView!
    @IBOutlet weak var support: UIView!
    @IBOutlet weak var studentid: UIView!
    @IBOutlet weak var docs: UIView!
    @IBOutlet weak var bills: UIView!
    @IBOutlet weak var signout: UIView!
    @IBOutlet weak var theme: UIView!
    @IBOutlet weak var languages: UIView!
    @IBOutlet weak var studentconstrain: NSLayoutConstraint!
}
extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -7.0, 7.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
 }
}
