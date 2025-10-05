
import UIKit

class IssueStatusVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var nothinghereView: UIView!
    @IBOutlet weak var StatusTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        StatusTableView.dataSource = self
        StatusTableView.delegate = self
        nothinghereView.isHidden = true
    }
    
    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com
     
     // Prepare for segue, if needed
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "IssueDetailVC" {
//             // Configure the destination view controller
//         }
//     }
    
}
