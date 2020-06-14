import UIKit

class ViewController: UIViewController {
        let segmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["First", "Second", "Third"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.backgroundColor = .gray
    return sc
        }()

        let firstView: UIView = {
    let v = UIView()
            v.backgroundColor = .green
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addSubview(UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 100)))
            v.addSubview(UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 150)))
    return v
        }()

    let secondView: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        v.isHidden = true
        v.addSubview(UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        v.addSubview(UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
return v
    }()

    let thirdView: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .purple
        v.isHidden = true
        let img1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let img2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        img1.backgroundColor = .red
        img2.backgroundColor = .black
        v.addSubview(img1)
        v.addSubview(img2)
return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
setupGraphics()
        setupActions()
    }
}

