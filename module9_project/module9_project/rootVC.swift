import UIKit

class RootVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var vcs = [UIViewController]()
                vcs.append(FirsttBTNVC())
viewControllers = vcs
    }
}
