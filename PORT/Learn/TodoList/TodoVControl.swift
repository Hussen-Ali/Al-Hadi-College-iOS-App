import UIKit
import CoreData
class TodoListViewController: UIViewController {
    
    @IBOutlet weak var nothingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var items: [(text: String, date: Date)] = []
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            managedObjectContext = appDelegate.persistentContainer.viewContext
        }
        retrieveValues()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        present(alertController, animated: true, completion: nil)
    }
    
    func addItem(_ item: String) {
        dbSave(value: item)
        retrieveValues()
        tableView.reloadData()
        updateNothingViewVisibility()
    }
    
    func removeItem(at index: Int) {
        let item = items[index]
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }

    func dbSave(value: String) {
        guard let context = managedObjectContext else {
            print("Error: Managed Object Context is nil")
            return
        }
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TODO", in: context) else {
            print("Error: Could not find entity desc for name 'TODO'")
            return
        }
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
    
    func retrieveValues() {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        cell.textlabel.text = items[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(at: indexPath.row)
        }
    }
}


