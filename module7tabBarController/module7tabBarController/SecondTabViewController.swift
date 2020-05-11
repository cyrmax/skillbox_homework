import UIKit

class SecondTabViewController: UIViewController, ColorDelegate {
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

    let CCView: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let childController: SecondInternalController = {
return SecondInternalController()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        childController.delegate = self
addChild(childController)
setupGraphics()
        childController.didMove(toParent: self)
        redButton.addTarget(self, action: #selector(childController.setRed), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(childController.setGreen), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(childController.setBlue), for: .touchUpInside)
    }

    func setupGraphics() {
        stack.addArrangedSubview(redButton)
        stack.addArrangedSubview(greenButton)
        stack.addArrangedSubview(blueButton)
        view.addSubview(stack)
        view.addSubview(childController.view)
        stack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        childController.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        childController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        childController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        childController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }

    func setRed() {
        view.backgroundColor = .red
    }

    func setGreen() {
        view.backgroundColor = .green
    }

    func setBlue() {
        view.backgroundColor = .blue
    }
}
