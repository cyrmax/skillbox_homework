import UIKit


class NameVC: UIViewController {
let kNameKey = "firstname"
    let kLastnameKey = "lastname"
    var guide: UILayoutGuide {
        view.safeAreaLayoutGuide
    }

    let nameTF: UITextField = {
let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .yellow
        tf.placeholder = "Firstname"
return tf
    }()

    let lastnameTF: UITextField = {
let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .yellow
        tf.placeholder = "lastname"
        return tf
    }()

    let saveBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        btn.setTitle("Save", for: .normal)
        return btn
    }()

    let stack: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
title = "Name"
        stack.addArrangedSubview(nameTF)
        stack.addArrangedSubview(lastnameTF)
        stack.addArrangedSubview(saveBtn)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            stack.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
            stack.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -70)
        ])

        saveBtn.addTarget(self, action: #selector(save), for: .touchUpInside)

        nameTF.text = UserDefaults.standard.string(forKey: kNameKey)
        lastnameTF.text = UserDefaults.standard.string(forKey: kLastnameKey)
    }

    @objc func save() {
        if let name = nameTF.text {
            UserDefaults.standard.set(name, forKey: kNameKey)
        }

        if let lastname = lastnameTF.text {
            UserDefaults.standard.set(lastname, forKey: kLastnameKey)
        }
    }
}
