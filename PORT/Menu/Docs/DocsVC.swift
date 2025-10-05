import UIKit
import KeychainSwift

class DocsVC: UIViewController {

    @IBOutlet weak var IBtableview: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    var docs: DocumentResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        let keychain = KeychainSwift()
        IBtableview.dataSource = self
        IBtableview.delegate = self
        IBtableview.register(UINib(nibName: "PDFTableViewCell", bundle: nil), forCellReuseIdentifier: "PDFReusableCellID")
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
}

extension DocsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs?.documents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PDFReusableCellID", for: indexPath) as! PDFTableViewCell
        
        if let document = docs?.documents[indexPath.row] {
            cell.documentURL = URL(string: document.file ?? "")

            cell.docLabel.text = document.name
            cell.docThumbnail.image = UIImage(named: "defaultThumbnail")
            
            if let thumbnailURL = document.thumbnail, let url = URL(string: thumbnailURL) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            cell.docThumbnail.image = UIImage(data: data)
                            self.activityIndicator.stopAnimating()

                        }
                    }
                }
            }
            
            if let pageCount = document.page_count {
                cell.pagenumber.text = "\(pageCount)"
            } else {
                cell.pagenumber.text = "Page count not available"
            }
        }
        
        return cell
    }
}

extension DocsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
}

