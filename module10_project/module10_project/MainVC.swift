import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var vcs = [UIViewController]()
        vcs.append(ScrollVC())
        vcs.append(CollectionVC())
        viewControllers = vcs
}

}
