
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
let secondTab = ThirdTabViewController()
        secondTab.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 2)
        controllers.append(secondTab)
        viewControllers = controllers
    }
}
