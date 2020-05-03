
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
var controllers = [UIViewController]()
let firstNav = UINavigationController(rootViewController: FirstTabViewController())
        controllers.append(firstNav)
        controllers.append(SecondTabViewController())
        viewControllers = controllers
    }
}
