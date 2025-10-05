
import UIKit
import KeychainSwift

class LectFolders: UIViewController {
    let keychain = KeychainSwift()
    var materialsArray: [MaterialsStruct] = []
    var selectedId: Int?

    @IBOutlet weak var folderTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        folderTableV.dataSource = self
        folderTableV.delegate = self
        folderTableV.backgroundColor = .clear

        let urlString = "https://port.huc.edu.iq/this%20is%20random%20link%20hosin/departments/get_materials_list"
        let url = URL(string: urlString)!
        let accessToken = "\(keychain.get("accesstoken") ?? "no")"
        var request = URLRequest(url: url)
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        task.resume()
    }

}
extension LectFolders: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lectFoldCellID", for: indexPath) as! FolderCell
        let material = materialsArray[indexPath.row]
        cell.folderlabel.text = material.name
        return cell
    }
    
    
}
extension LectFolders: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let material = materialsArray[indexPath.row]
        selectedId = material.id 

        if let reusableDocVC = storyboard?.instantiateViewController(withIdentifier: "ReusableDoc") as? ReusableDoc {
            reusableDocVC.dataURL = URL(string: "https://port.huc.edu.iq/this%20is%20random%20link%20hosin/departments/get_material_files/\(material.id)")
            navigationController?.pushViewController(reusableDocVC, animated: true)
        }
    }
}
