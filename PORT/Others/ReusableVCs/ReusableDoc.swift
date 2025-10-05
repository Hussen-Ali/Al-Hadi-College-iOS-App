import UIKit
import KeychainSwift

class ReusableDoc: UIViewController {

    @IBOutlet weak var IBtableview: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: .large)

    var dataURL: URL?
    var responseData: [RusableModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        let keychain = KeychainSwift()
        IBtableview.dataSource = self
        IBtableview.delegate = self
        
        if let url = dataURL {
            let accessToken = "\(keychain.get("accesstoken") ?? "no")"
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
            task.resume()
        }
    }
}

extension ReusableDoc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RusableCellID", for: indexPath) as! RusableCell
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
   
        }
        
        return cell
    }
}

extension ReusableDoc: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        activityIndicator.startAnimating()

        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
            downloadTask.resume()
        }
    }
}



extension ReusableDoc: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}

