import UIKit
import KeychainSwift

class UniversityInfoVC: UIViewController {
    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                
                DispatchQueue.main.async {
                    self.Dept.text = ("\(responseJSON["dep"] ?? "القسم")")
                    self.Educ.text = ("\(responseJSON["edu"] ?? "الدراسة")")
                    self.StartD.text = ("\(responseJSON["start_year"] ?? "بداية الدراسة")")
                    self.Windowl.text = ("\(responseJSON["window"] ?? "نهاية الدراسة")")
                    self.branchlbl.text = ("\(responseJSON["way"] ?? "الفرع")")
                    self.UniNumb.text = ("\(responseJSON["univenumber"] ?? "رقم الجامعة")")
                    self.Emaillb.text = ("\(responseJSON["email"] ?? "الايميل")")
                    self.activityIndicator.stopAnimating()

                }
            }
            
            
        }
        task.resume()
        
        
        
        
        
        
        
        
        
    }
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var Dept: UILabel!
    @IBOutlet weak var Educ: UILabel!
    @IBOutlet weak var StartD: UILabel!
    @IBOutlet weak var Windowl: UILabel!
    @IBOutlet weak var branchlbl: UILabel!
    @IBOutlet weak var UniNumb: UILabel!
    @IBOutlet weak var Emaillb: UILabel!
    @IBOutlet weak var ViewHeight: NSLayoutConstraint!
}
