
import UIKit

class PDFTableViewCell: UITableViewCell {
    
    var documentURL: URL?

    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15.0
        docThumbnail.layer.cornerRadius = 10
        cellView.clipsToBounds = true
        threeDotsB.transform = threeDotsB.transform.rotated(by: CGFloat(Double.pi / 2))
        setPopUpButton()
        
    }
    
    
    func setPopUpButton(){
        
        let optionClosure: UIActionHandler = { [weak self] action in
             guard let self = self else { return }

             if action.title == "Open" {
                 self.openDocument()
             } else if action.title == "Download" {
                 self.downloadDocument()
             }
         }
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        threeDotsB.menu = UIMenu(children: [openAction, downloadAction])
        threeDotsB.showsMenuAsPrimaryAction = true
        threeDotsB.changesSelectionAsPrimaryAction = false
        
    }
    private func openDocument() {
        if let url = documentURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    private func downloadDocument() {
         if let url = documentURL {
             let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent(url.lastPathComponent)
             
             let downloadTask = URLSession.shared.downloadTask(with: url) { (temporaryURL, response, error) in
                 if let temporaryURL = temporaryURL {
                     do {
                         try FileManager.default.moveItem(at: temporaryURL, to: destinationURL)
                         print("File downloaded and saved at: \(destinationURL)")
                     } catch {
                         print("Error moving file: \(error)")
                     }
                 } else {
                     print("Error downloading file: \(error?.localizedDescription ?? "Unknown error")")
                 }
             }
             downloadTask.resume()
         }
     }
    @IBOutlet weak var threeDotsB: UIButton!
    @IBOutlet weak var pagenumber: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var docThumbnail: UIImageView!
    @IBOutlet weak var docLabel: UILabel!
}
    
