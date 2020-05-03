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
        buttonsStack.addSubview(greenButton)
        buttonsStack.addSubview(blueButton)
        buttonsStack.addSubview(redButton)
        view.addSubview(buttonsStack)
        buttonsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        buttonsStack.heightAnchor.constraint(equalToConstant: 120).isActive = true
        buttonsStack.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
