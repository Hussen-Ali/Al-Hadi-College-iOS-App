
import UIKit
import Toast_Swift


class RusableCell: UITableViewCell {
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var threeDots: UIButton!
    @IBOutlet weak var pageNumber: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
     var docURL: URL?
    let activityIndicator = UIActivityIndicatorView(style: .medium)

    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com
    func setPopUpButton(){
        
        
        let optionClosure: UIActionHandler = { [weak self] action in
             guard let self = self else { return }

             if action.title == NSLocalizedString("download", comment: "") {
                 self.openDocument()
             }
        //         else if action.title == NSLocalizedString("download", comment: "") {
//                 self.downloadDocument()
//             }
         }
        
        let openAction = UIAction(title: NSLocalizedString("download", comment: ""), image: UIImage(systemName: "arrow.down.circle"), identifier: nil, discoverabilityTitle: nil, attributes: [], handler: optionClosure)
        //let downloadAction = UIAction(title: NSLocalizedString("download", comment: ""), image: UIImage(systemName: "arrow.down.circle"), identifier: nil, discoverabilityTitle: nil, attributes: [], handler: optionClosure)
//arrow.down.circle

        threeDots.menu = UIMenu(children: [openAction])
        threeDots.showsMenuAsPrimaryAction = true
        threeDots.changesSelectionAsPrimaryAction = false
        
    }
    private func openDocument() {
        if let url = docURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
//    private func downloadDocument() {
    // Full version not included in this public release.
    // Contact the developer for access or details:
    // GitHub: https://github.com/Hussen-Ali
    // Email: hsentaqi@gmail.com

}
