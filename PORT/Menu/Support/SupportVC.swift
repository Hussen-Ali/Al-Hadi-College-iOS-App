
import UIKit
import LZViewPager
class SupportVC:UIViewController,LZViewPagerDelegate,LZViewPagerDataSource {

    private var subControllers: [UIViewController] = []
    @IBOutlet weak var ViewPager: LZViewPager!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPagerProperties()
    }
    
    func viewPagerProperties(){
        // Full version not included in this public release.
        // Contact the developer for access or details:
        // GitHub: https://github.com/Hussen-Ali
        // Email: hsentaqi@gmail.com
        
    }
    func numberOfItems() -> Int {
        return self.subControllers.count

    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIColor(named: "ColorCyan")
        return button
    }
    func colorForIndicator(at index: Int) -> UIColor {
        return .white
    }
    func heightForIndicator() -> CGFloat {
        return 3
    }
    func backgroundColorForHeader() -> UIColor {
        return UIColor(named: "ColorCyan")!
    }
    func heightForHeader() -> CGFloat {
        return 48
    }
    func widthForIndicator(at index: Int) -> CGFloat {
        return 75
    }




}
