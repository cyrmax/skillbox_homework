import UIKit
import MobileCoreServices

class mainScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
view = MainScreenView()

        if UserDefaults.standard.bool(forKey: "shouldOpenLastBook") {
            self.lastBook()
        }
    }

}
