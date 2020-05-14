import UIKit


class SecondTabViewController: UIViewController, SecondTabDelegate {
    let colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Green Selected"
        label.translatesAutoresizingMaskIntoConstraints = false
return label
    }()

    let changeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Change", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        changeBtn.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }

    @objc func changeColor() {
let vc = SecondInternalController()
        vc.delegate = self
present(vc, animated: true)
    }

    func setupGraphics() {
        view.addSubview(colorLabel)
        view.addSubview(changeBtn)
        colorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  10).isActive = true
        colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  15).isActive = true
        colorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        colorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        changeBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        changeBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  15).isActive = true
        changeBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -15).isActive = true
        changeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    func setRed() {
        colorLabel.text = "Red selected"
    }

    func setGreen() {
        colorLabel.text = "Green selected"
    }

    func setBlue() {
        colorLabel.text = "Blue selected"
    }
}
