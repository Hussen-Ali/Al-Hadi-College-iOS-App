import KeychainSwift
import UIKit

class IDVC: UIViewController {
    
    let keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        let deptstring = UserDefaults.standard.string(forKey: "dep_name")
        studentName.text = UserDefaults.standard.string(forKey: "namedata") ?? NSLocalizedString("nodata", comment: "")
        dept.text = deptstring
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
                    
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        
    }
    
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var expdate: UILabel!
    @IBOutlet weak var startdate: UILabel!
    @IBOutlet weak var validImage: UIImageView!
    @IBOutlet weak var dept: UILabel!
    @IBOutlet weak var stage: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    private func viewsWithTag(_ tag: Int) -> UIView? {
        return view.viewWithTag(tag)
    }
    func formatDateString(_ dateString: String) -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatterInput.date(from: dateString) {
            return dateFormatterOutput.string(from: date)
        } else {
            print("Invalid date string")
            return ""
        }
    }
    
}
