import UIKit

class ViewController: UIViewController {
    var currentAnimation: Int = 0
    var animationsArray: [() -> Void] = []

    override func loadView() {
        self.view = RootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
let v = view as! RootView
animationsArray = [
    v.animateColor,
    v.animateMovement,
    v.animateRound,
    v.animateSpin,
    v.animateDisappear,
    v.animateScale,
    v.animateRotation
        ]
        animationsArray[0]()
    }

    @objc func previousAnimation() {
        (view as! RootView).stopAnimations()
        guard currentAnimation > 0 else { return }
currentAnimation -= 1
        (view as! RootView).numLbl.text = currentAnimation.description
animationsArray[currentAnimation]()
    }

    @objc func nextAnimation() {
        (view as! RootView).stopAnimations()
        guard currentAnimation < animationsArray.count - 1 else { return }
currentAnimation += 1
        (view as! RootView).numLbl.text = currentAnimation.description
animationsArray[currentAnimation]()
    }
}

