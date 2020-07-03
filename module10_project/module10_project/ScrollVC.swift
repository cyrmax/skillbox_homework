import UIKit

class ScrollVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ScrollView(frame: view.frame))
    }
}
