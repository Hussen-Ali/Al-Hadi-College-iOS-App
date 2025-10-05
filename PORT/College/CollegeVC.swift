
import UIKit

class CollegeVC: UIViewController {
    //@IBOutlet weak var Headerlbl: UILabel!
    @IBOutlet weak var CollegeTableView: UITableView!
    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com
    
}

extension CollegeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsLabels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCellID", for: indexPath) as! CollegeTVCell
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
}

extension CollegeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let Fee = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fees_limitsVC")
        if indexPath.item == 1 {
            navigationController?.pushViewController(Fee, animated: true)
        }
//        else if indexPath.item == 1 {
//            navigationController?.pushViewController(eduRec, animated: true)
//        } else if indexPath.item == 3 {
//            navigationController?.pushViewController(todo, animated: true)
//        }
    }
}

