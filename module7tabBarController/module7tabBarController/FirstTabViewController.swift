import UIKit

class FirstTabViewController: UIViewController {
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Green", for: .normal)
        button.addTarget(self, action: #selector(showGreen), for: .touchUpInside)
return button
    }()

    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Blue", for: .normal)
        button.addTarget(self, action: #selector(showBlue), for: .touchUpInside)
return button
    }()

    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("red", for: .normal)
        button.addTarget(self, action: #selector(showRed), for: .touchUpInside)
return button
    }()

    let buttonsStack: UIStackView = {
let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        view.backgroundColor = .gray
setupGraphics()
    }

    @objc func showGreen() {
present(GreenController(), animated:  true)
    }

    @objc func showBlue() {
present(BlueController(), animated:  true)
    }

    @objc func showRed() {
        present(BlueController(), animated: true)
    }

    func setupGraphics() {
        buttonsStack.addArrangedSubview(greenButton)
        buttonsStack.addArrangedSubview(blueButton)
        buttonsStack.addArrangedSubview(redButton)
        greenButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        greenButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        blueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        blueButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        redButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        redButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.addSubview(buttonsStack)
        buttonsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        buttonsStack.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        buttonsStack.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
