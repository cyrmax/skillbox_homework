import UIKit

class SecondInternalController: UIViewController {
    weak var delegate: SecondTabDelegate?
    let colorLabel: UILabel = {
let label = UILabel()
        label.text = "Green Selected"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select red", for: .normal)
        return btn
    }()

    let greenBtn: UIButton = {
let btn = UIButton()
        btn.setTitle("Select green", for: .normal)
return btn
    }()

    let blueBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select blue", for: .normal)
return btn
    }()

    let stack: UIStackView = {
let st = UIStackView()
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fillEqually
        st.translatesAutoresizingMaskIntoConstraints = false
return st
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        redBtn.addTarget(self, action: #selector(setRed), for: .touchUpInside)
        greenBtn.addTarget(self, action: #selector(setGreen), for: .touchUpInside)
        blueBtn.addTarget(self, action: #selector(setBlue), for: .touchUpInside)
    }

    @objc func selectRed() {

    }
    func setupGraphics() {
        view.addSubview(colorLabel)
        stack.addArrangedSubview(redBtn)
        stack.addArrangedSubview(greenBtn)
        stack.addArrangedSubview(blueBtn)
        colorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        colorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        colorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -10).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    @objc func setRed() {
        delegate?.setRed()
dismiss(animated: true, completion: nil)
    }

    @objc func setGreen() {
        delegate?.setGreen()
        dismiss(animated: true, completion: nil)
    }

    @objc func setBlue() {
        delegate?.setBlue()
        dismiss(animated: true, completion: nil)
    }
}



@objc protocol SecondTabDelegate: AnyObject {
@objc func setRed()
    @objc func setGreen()
    @objc func setBlue()
}
