import UIKit

class ViewController: UIViewController {

    let inputTF: UITextField = {
let tf = UITextField()
        tf.placeholder = "Enter data here"
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
return tf
    }()
    let resultLabel: UILabel = {
let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
return label
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Perform", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
setConstraints()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        guard let text = inputTF.text else { return }
        if !text.isEmpty {
            resultLabel.text = text + " " + resultLabel.text!
        }
    }

    func setConstraints() {
        view.addSubview(inputTF)
        view.addSubview(resultLabel)
        view.addSubview(button)
        inputTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        inputTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -10).isActive = true
        inputTF.heightAnchor.constraint(equalToConstant: 70).isActive = true
        inputTF.topAnchor.constraint(equalTo: view.topAnchor, constant:  70).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -10).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        resultLabel.topAnchor.constraint(equalTo: inputTF.bottomAnchor, constant: 5).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant:  5).isActive = true
    }
}

