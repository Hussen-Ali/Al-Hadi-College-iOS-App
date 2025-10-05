import UIKit
import FlexibleSteppedProgressBar
import KeychainSwift

class BillsVC: UIViewController, FlexibleSteppedProgressBarDelegate,UITableViewDelegate,UITableViewDataSource{
    var apiDataLoaded = false
    var numberOfPayments: Int?
    var arrr = [labels]()
    var progressBar: FlexibleSteppedProgressBar!
    let keychain = KeychainSwift()
    var remainingFees: Int?
    var paidFees: Int?
    var totalFees: Int?
    var jsdateArray: [String] = []
    var jspaidArray: [Int] = []
    var jsremainingArray: [Int] = []
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        callingAPI()
        configureSecondView()
        setupData()
        tableviewbills.dataSource = self
        tableviewbills.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.setHidesBackButton(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.setHidesBackButton(false, animated: animated)
    }
    
    private func callingAPI(){
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let castingPayment = responseJSON["number_of_payments"] as? Int {
                        self.numberOfPayments = castingPayment
                        self.remainingFees = responseJSON["remain"] as? Int
                        self.paidFees = responseJSON["paid"] as? Int
                        self.totalFees = responseJSON["fee"] as? Int
                        DispatchQueue.main.async { [self] in
                            // Full version not included in this public release.
                            // Contact the developer for access or details:
                            // GitHub: https://github.com/Hussen-Ali
                            // Email: hsentaqi@gmail.com          }
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    private func updateLabels() {
        ibremainingfees.text = remainingFees.map(String.init)
        ibpaidfees.text = paidFees.map(String.init)
        ibtotalfees.text = totalFees.map(String.init)
        configureProgressBar() // Move the configuration here

    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewbills.dequeueReusableCell(withIdentifier: "billscell", for: indexPath) as! BillsCell
        
        if apiDataLoaded {
            let formattedDate = formatDateString(jsdateArray[indexPath.section])
            let paid = jspaidArray[indexPath.section]
            let remaining = jsremainingArray[indexPath.section]
            cell.setupCell(datearg: formattedDate, paidarg: paid, remainarg: remaining)
        } else {
            cell.setupCell(datearg: "Loading...", paidarg: 0, remainarg: 0)
        }

        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfPayments ?? 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        return headerView
    }
    
    // MARK: - Private Methods
    private func configureProgressBar() {
        progressBar = FlexibleSteppedProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressView.addSubview(progressBar)
        let horizontalConstraint = progressBar.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        let verticalConstraint = progressBar.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 5)
        let widthConstraint = progressBar.widthAnchor.constraint(equalToConstant: 1060) // change the width
        let heightConstraint = progressBar.heightAnchor.constraint(equalToConstant: 1060) // change the height
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
    }
    
    private func configureSecondView() {
        secondView.layer.cornerRadius = 25.0
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 0.3
        secondView.layer.shadowOffset = CGSize(width: 0, height: 5)
        secondView.layer.shadowRadius = 3
    }
    
    private func setupData() {
        arrr.append(labels(label: "40,000"))
        arrr.append(labels(label: "80,000"))
        arrr.append(labels(label: "100,000"))
        arrr.append(labels(label: "90,000"))
    }
    
    func formatDateString(_ dateString: String) -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatterInput.date(from: dateString) {
            return dateFormatterOutput.string(from: date)
        } else {
            print("Invalid date string")
            return ""
        }
    }
    
    // MARK: - FlexibleSteppedProgressBarDelegate
    
    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var ibremainingfees: UILabel!
    @IBOutlet weak var ibpaidfees: UILabel!
    @IBOutlet weak var ibtotalfees: UILabel!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var tableviewbills: UITableView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var doneView: UIProgressView!
}



class RoundedBottomView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius: CGFloat = 25.0
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
struct labels{
    let label: String
}
