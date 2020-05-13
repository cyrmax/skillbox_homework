import UIKit

class SecondInternalController: UIViewController {
    weak var delegate: ColorDelegate?
    let redButton: UIButton = {
let button = UIButton()
        button.setTitle("Red", for: .normal)
return button
    }()

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

    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        redButton.addTarget(delegate, action: #selector(setRed), for: .touchUpInside)
        greenButton.addTarget(delegate, action: #selector(setGreen), for: .touchUpInside)
        blueButton.addTarget(delegate, action: #selector(setBlue), for: .touchUpInside)
setupGraphics()
    }

    func setupGraphics() {
        stack.addArrangedSubview(redButton)
        stack.addArrangedSubview(greenButton)
        stack.addArrangedSubview(blueButton)
        view.addSubview(stack)
        stack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
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


@objc protocol ColorDelegate: AnyObject {
@objc func setRed()
@objc func setGreen()
    @objc func setBlue()
}
