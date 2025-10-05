import UIKit
import Network
import GoogleSignIn
class NoInternetVC: UIViewController {
    var window: UIWindow?
    
    @IBOutlet weak var nointernet: UILabel!
    @IBOutlet weak var nointernetbtn: UIButton!
    @IBOutlet weak var nointernettitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nointernet.text = NSLocalizedString("nointernet", comment: "")
        nointernettitle.text = NSLocalizedString("nointernettitle", comment: "")
        nointernetbtn.titleLabel?.text = NSLocalizedString("nointernetbtn", comment: "")
    }
    
    
    @IBAction func refreshbt(_ sender: Any) {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
            if GIDSignIn.sharedInstance.hasPreviousSignIn() {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first else {
                    // Full version not included in this public release.
                    // Contact the developer for access or details:
                    // GitHub: https://github.com/Hussen-Ali
                    // Email: hsentaqi@gmail.com

        }}
        func checkInternetConnection() -> Bool {
            let monitor = NWPathMonitor()
            let semaphore = DispatchSemaphore(value: 0)
            var isConnected = false
            // Full version not included in this public release.
            // Contact the developer for access or details:
            // GitHub: https://github.com/Hussen-Ali
            // Email: hsentaqi@gmail.com
        }
    
