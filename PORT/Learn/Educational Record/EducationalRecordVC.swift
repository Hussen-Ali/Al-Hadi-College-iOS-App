import UIKit
import KeychainSwift

class EducationalRecordVC: UIViewController {

    @IBOutlet weak var tableVVHeight: NSLayoutConstraint!
    @IBOutlet weak var tableVView: UIView!
    @IBOutlet weak var eduTableView: UITableView!
    @IBOutlet weak var comSubView: UIView!
    @IBOutlet weak var commenceView: UIView!

    @IBOutlet weak var contentviews: UIView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var dept: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    
    let keychain = KeychainSwift()
    var studentDataModel: StudentDataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell nib
        eduTableView.register(UINib(nibName: "eduCell", bundle: nil), forCellReuseIdentifier: "eduCellid")
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
}

extension EducationalRecordVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentDataModel?.Student_stages.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eduCellid", for: indexPath) as! eduCell
        
        if let stage = studentDataModel?.Student_stages[indexPath.row] {
            if stage.Resuit == "راسب" { // علساس Result بس ابو الباكيند هيج كاتبهة
                cell.resultViewib.backgroundColor = UIColor(named: "ColorWeakView")
                cell.resultViewib.layer.borderWidth = 1.0
                cell.resultViewib.layer.borderColor = UIColor(named: "ColorWeak")?.cgColor
                cell.resultib.textColor = UIColor(named: "ColorWeak")
            }
            cell.stageib.text = stage.stage
            cell.statid.text = stage.State
            cell.attemp.text = stage.roletype
            cell.resultib.text = stage.Resuit
            cell.yearib.text = stage.year
        }
        
        cell.viewForStack.layer.borderColor = UIColor.lightGray.cgColor
        cell.viewForStack.layer.borderWidth = 0.4
        cell.resultViewib.layer.borderColor = UIColor.lightGray.cgColor
        cell.resultViewib.layer.borderWidth = 1
        cell.resultViewib.layer.cornerRadius = 4
        
        return cell
    }
}

extension EducationalRecordVC: UITableViewDelegate {
    // Implement any additional UITableViewDelegate methods if needed
}

struct StudentDataModel: Codable {
    let start_year: String?
    let Student_stages: [StudentStage]
}

struct StudentStage: Codable {
    let year: String
    let stage: String
    let Resuit: String
    let roletype: String
    let State: String
}
