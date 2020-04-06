import UIKit

class FirstTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        view.backgroundColor = .blue
    }
}
