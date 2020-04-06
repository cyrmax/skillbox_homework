
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
let controllers = [FirstTabViewController(), SecondTabViewController()]
        viewControllers = controllers
    }
}
