import KeychainSwift
import UIKit

class GradeVC: UIViewController {
    @IBOutlet weak var segmentheight: NSLayoutConstraint!

    @IBAction func segmentaction(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
           gradesTable.reloadData()
    }
    var keychain = KeychainSwift()
    var responseData: ResponseData?
    var selectedSegmentIndex = 0
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        
        task.resume()
    }
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var resultib: UILabel!
    @IBOutlet weak var totalgrade: UILabel!
    @IBOutlet weak var atemp: UILabel!
    @IBOutlet weak var dept: UILabel!
    @IBOutlet weak var stage: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var gradesTable: UITableView!
    
    private func UIsetup(){
        self.studentImage.layer.cornerRadius = self.studentImage.frame.width / 2
        for i in 1...2 {
            viewsWithTag(i)?.layer.cornerRadius = 20
            viewsWithTag(i)?.layer.shadowColor = UIColor.black.cgColor
            viewsWithTag(i)?.layer.shadowOpacity = 0.05
            viewsWithTag(i)?.layer.shadowOffset = CGSize(width: 0, height: 3)
            viewsWithTag(i)?.layer.shadowRadius = 4
        }
    }
    private func viewsWithTag(_ tag: Int) -> UIView? {
        return view.viewWithTag(tag)
    }
    
}
extension GradeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSegmentIndex == 0 {
                return responseData?.materialsWithType.first?.studentMaterials.count ?? 0
            } else {
                return responseData?.materialsWithType.last?.studentMaterials.count ?? 0
            }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "materialid", for: indexPath) as! materialCell
        if selectedSegmentIndex == 0 {
            if let studentMaterial = responseData?.materialsWithType[0].studentMaterials[indexPath.row] {
                cell.materialName.text = studentMaterial.material
                cell.materialDegree.text = studentMaterial.appreciation
                
                if studentMaterial.isCarry {
                    cell.isCarry.text = "(محمل)"
                }
                
                if studentMaterial.appreciation == "ضعيف" {
                    cell.content.backgroundColor = UIColor(named: "ColorWeakView")
                    cell.content.layer.borderWidth = 1.0
                    cell.content.layer.borderColor = UIColor(named: "ColorWeak")?.cgColor
                    cell.materialDegree.textColor = UIColor(named: "ColorWeak")
                }
            }

            } else {
                if let studentMaterial = responseData?.materialsWithType[1].studentMaterials[indexPath.row] {
                    cell.materialName.text = studentMaterial.material
                    cell.materialDegree.text = studentMaterial.appreciation
                    
                    if studentMaterial.isCarry {
                        cell.isCarry.text = "(محمل)"
                    }
                    
                    if studentMaterial.appreciation == "ضعيف" {
                        cell.content.backgroundColor = UIColor(named: "ColorWeakView")
                        cell.content.layer.borderWidth = 1.0
                        cell.content.layer.borderColor = UIColor(named: "ColorWeak")?.cgColor
                        cell.materialDegree.textColor = UIColor(named: "ColorWeak")
                    }
                }

            }
        
        return cell
    }

}

extension GradeVC: UITableViewDelegate{
    
}




