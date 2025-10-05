import UIKit
import KeychainSwift
class PersonalInfoVC: UIViewController {
let keychain = KeychainSwift()
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        applyBorder(to: MainView)
        applyBorder(to: ContactView)
        applyBorder(to: AdressView)
        applyBorder(to: AdditionalView)
//        for i in 10...24 {
//           labelWithTag(i)?.text = NSLocalizedString("\(i)", comment: "")
//            }
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com

        let accessToken = "\(keychain.get("accesstoken") ?? "no")"
        var request = URLRequest(url: url)
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
     
            if let responseJSON = responseJSON as? [String: Any] {
                DispatchQueue.main.async {
                    self.namelbl.text = responseJSON["full_name"] as? String ?? ""
                    self.motherlbl.text = responseJSON["mother_name"] as? String ?? ""
                    self.birthlbl.text = responseJSON["birth_year"] as? String ?? ""
                    self.genderlbl.text = responseJSON["sex"] as? String ?? ""
                    // Full version not included in this public release.
                    // Contact the developer for access or details:
                    // GitHub: https://github.com/Hussen-Ali
                    // Email: hsentaqi@gmail.com
            }

                

        }
        task.resume()
        
    }
    func labelWithTag(_ tag: Int) -> UILabel? {
        return view.viewWithTag(tag) as? UILabel
    }
    @IBOutlet weak var ContactView: UIView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var AdressView: UIView!
    @IBOutlet weak var AdditionalView: UIView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var motherlbl: UILabel!
    @IBOutlet weak var birthlbl: UILabel!
    @IBOutlet weak var genderlbl: UILabel!
    @IBOutlet weak var phonelbl: UILabel!
    @IBOutlet weak var pphonelbl: UILabel!
    @IBOutlet weak var govlbl: UILabel!
    @IBOutlet weak var addlbl: UILabel!
    @IBOutlet weak var nationlbl: UILabel!
    @IBOutlet weak var nationlismlbl: UILabel!
    @IBOutlet weak var religlbl: UILabel!
}
    


func applyBorder(to view: UIView) {
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.cornerRadius = 10.0
    view.clipsToBounds = true
}
