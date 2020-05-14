
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
let ThirdTab = ThirdTabViewController()
        ThirdTab.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 2)
        controllers.append(ThirdTab)
        viewControllers = controllers
    }
}
