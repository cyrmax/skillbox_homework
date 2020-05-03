
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
var controllers = [UIViewController]()
let firstNav = UINavigationController(rootViewController: FirstTabViewController())
        firstNav.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        controllers.append(firstNav)
        controllers.append(SecondTabViewController())
        viewControllers = controllers
    }
}
