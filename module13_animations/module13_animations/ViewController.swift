import UIKit

class ViewController: UIViewController {

    override func loadView() {
        self.view = RootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func previousAnimation() {

    }

    @objc func nextAnimation() {
        (view as! RootView).animateScale()
    }
}

