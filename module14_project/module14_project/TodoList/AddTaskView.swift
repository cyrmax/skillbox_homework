import UIKit

class AddTaskView: UIView {
    var guide: UILayoutGuide {
        self.safeAreaLayoutGuide
    }

    let nameTF: UITextField = {
let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .green
        return tf
    }()

    let addBtn: UIButton = {
let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        btn.setTitle("Add", for: .normal)
        return btn
    }()

    private func setupView() {
        self.backgroundColor = .black
        addSubview(nameTF)
        addSubview((addBtn))

        NSLayoutConstraint.activate([
//            addBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50),
            addBtn.topAnchor.constraint(equalTo: guide.topAnchor),
            addBtn.leftAnchor.constraint(equalTo: guide.leftAnchor),
            addBtn.rightAnchor.constraint(equalTo: guide.rightAnchor),
            addBtn.heightAnchor.constraint(equalToConstant: 50),
            nameTF.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            nameTF.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
        ])

        addBtn.addTarget(nil, action: #selector(AddTaskVC.addTask), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
