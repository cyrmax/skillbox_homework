
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
var controllers = [UIViewController]()
let firstTab = FirstTabViewController()
let firstNav = UINavigationController(rootViewController: firstTab)
        firstNav.setNavigationBarHidden(false, animated: true)
        firstNav.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        controllers.append(firstNav)
let secondTab = SecondTabViewController()
        secondTab.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
        controllers.append(secondTab)
        viewControllers = controllers
    }
}
