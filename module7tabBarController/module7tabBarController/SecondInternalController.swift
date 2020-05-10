import UIKit

class SecondInternalController: UIViewController {
    var delegate: ColorDelegate?
    let redButton: UIButton = {
let button = UIButton()
        button.setTitle("Red", for: .normal)
return button
    }
()

    let greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
return button
    }()

    let blueButton: UIButton = {
let button = UIButton()
        button.setTitle("Blue", for: .normal)
return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        redButton.addTarget(self, action: #selector(setRed), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(setGreen), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(setBlue), for: .touchUpInside)
    }

    @objc func setRed() {
        view.backgroundColor = .red
    }

    @objc func setGreen() {
        view.backgroundColor = .green
    }

    @objc func setBlue() {
        view.backgroundColor = .blue
    }
}


protocol ColorDelegate {
    func setBackground(color: UIColor)
}
