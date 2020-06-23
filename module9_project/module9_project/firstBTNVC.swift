import UIKit

class FirsttBTNVC: UIViewController {
    var SALG: UILayoutGuide!
    let btn1: UIButton = {
let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
return btn
    }()

        let btn2: UIButton = {
    let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .green
    return btn
        }()

        let btn3: UIButton = {
    let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .yellow
    return btn
        }()

        let stackBtn1: UIButton = {
    let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .blue
    return btn
        }()

        let stackBtn2: UIButton = {
    let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .green
    return btn
        }()

        let stackBtn3: UIButton = {
    let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .yellow
    return btn
        }()

    let stack: UIStackView = {
let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 4
return st
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        SALG = view.safeAreaLayoutGuide
setupGraphics()
    }

    func setupGraphics() {
//MARK: buttons without stack
        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(btn3)
        NSLayoutConstraint.activate([
            btn1.heightAnchor.constraint(equalToConstant: 70),
            btn2.heightAnchor.constraint(equalToConstant: 70),
            btn3.heightAnchor.constraint(equalToConstant: 70),
            btn1.topAnchor.constraint(equalTo: SALG.topAnchor),
            btn2.topAnchor.constraint(equalTo: SALG.topAnchor),
            btn3.topAnchor.constraint(equalTo: SALG.topAnchor),
            btn1.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 8),
            btn2.leftAnchor.constraint(equalTo: btn1.rightAnchor, constant: 4),
            btn3.leftAnchor.constraint(equalTo: btn2.rightAnchor, constant: 4),
            btn3.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -8),
            btn2.widthAnchor.constraint(equalTo: btn1.widthAnchor),
            btn3.widthAnchor.constraint(equalTo: btn2.widthAnchor)
        ])

        //MARK: stack buttons
        stack.addArrangedSubview(stackBtn1)
        stack.addArrangedSubview(stackBtn2)
        stack.addArrangedSubview(stackBtn3)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 150),
            stack.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 8),
            stack.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -8),
            stack.heightAnchor.constraint(equalToConstant: 70),
//            stackBtn2.leftAnchor.constraint(equalTo: stackBtn1.rightAnchor, constant: 4),
//            stackBtn3.leftAnchor.constraint(equalTo: stackBtn2.rightAnchor, constant: 4),
            stackBtn2.widthAnchor.constraint(equalTo: stackBtn1.widthAnchor),
            stackBtn3.widthAnchor.constraint(equalTo: stackBtn2.widthAnchor)
        ])
    }
}
