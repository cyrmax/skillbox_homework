import UIKit

class RootVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var vcs = [UIViewController]()
                vcs.append(FirsttBTNVC())
        vcs.append(SecondBtnVC())
        vcs.append(LabelsVC())
viewControllers = vcs
    }
}
