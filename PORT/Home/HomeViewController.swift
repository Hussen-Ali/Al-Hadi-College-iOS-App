
import UIKit

class HomeVC: UIViewController {
    private var viewModels: [APIResponse] = []
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    @IBOutlet weak var Headerlbl: UILabel!
    @IBOutlet weak var PostTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        navigationItem.title = NSLocalizedString("Welcome", comment: "")
        PostTableV.delegate = self
        PostTableV.dataSource = self
        PostTableV.register(UINib(nibName: "PostVCell", bundle: nil), forCellReuseIdentifier: "PostVCellID")
        reloadPostsData()
        
        
    }
    
    private func reloadPostsData() {
        APICaller.shared.getTopStories { [self] result in
            switch result {
            case .success(let apiResponse):
                self.viewModels = apiResponse

                DispatchQueue.main.async {
                    self.PostTableV.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
extension HomeVC {
    func formatRelativeTime(from timestamp: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let date = dateFormatter.date(from: timestamp) else {
            return nil
        }
        
        let relativeFormatter = RelativeDateTimeFormatter()
        relativeFormatter.unitsStyle = .full
        
        return relativeFormatter.localizedString(for: date, relativeTo: Date())
    }

}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedPost = viewModels[indexPath.row]
        performSegue(withIdentifier: "showPostDetailsegue", sender: selectedPost)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPostDetailsegue",
           let destinationVC = segue.destination as? PostDetailsVC,
           let selectedPost = sender as? APIResponse {
            destinationVC.post = selectedPost
        }
    }
}

