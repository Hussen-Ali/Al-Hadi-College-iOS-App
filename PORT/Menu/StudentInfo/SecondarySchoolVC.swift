import UIKit
import KeychainSwift

class SecondarySchoolVC: UIViewController {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let keychain = KeychainSwift()
        override func viewDidLoad() {
            super.viewDidLoad()
            if UIScreen.main.bounds.height < 900 {
                ViewHeight.constant = 150
            }
    
            activityIndicator.center = self.view.center
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
//            for i in 25...32 {
//                    labelWithTag(i)?.text = NSLocalizedString("\(i)", comment: "")
//                }
            MainView.layer.borderWidth = 1.0
            MainView.layer.borderColor = UIColor.lightGray.cgColor
            MainView.layer.cornerRadius = 10.0
            MainView.clipsToBounds = true

            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
                if let responseJSON = responseJSON as? [String: Any] {
                    DispatchQueue.main.async {
                        self.Schoolnm.text = ("\(responseJSON["schoo_name"] ?? "اسم المدرسة الاعدادية")")
                        self.Director.text = ("\(responseJSON["md_name"] ?? "اسم المديرية")")
                        self.Gratnum.text = ("\(responseJSON["record_number"] ?? "عدد وثيقة التخرج")")
                        self.Gratdate.text = ("\(responseJSON["record_number_date"] ?? "تاريخ اصدار وثيقة")")
                        self.Branch.text = ("\(responseJSON["way"] ?? "الفرع")")
                        self.Attempt.text = ("\(responseJSON["Dorea"] ?? "الدور")")
                        self.activityIndicator.stopAnimating()

                    }

              }

            }
            task.resume()
        
        
        
        
     
            
    }

    @IBOutlet weak var ViewHeight: NSLayoutConstraint!
    @IBOutlet weak var Schoolnm: UILabel!
    @IBOutlet weak var Director: UILabel!
    @IBOutlet weak var Gratnum: UILabel!
    @IBOutlet weak var Gratdate: UILabel!
    @IBOutlet weak var Branch: UILabel!
    @IBOutlet weak var Attempt: UILabel!
    @IBOutlet weak var MainView: UIView!
}
