import UIKit

class SecondBtnVC: UIViewController {
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
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
        st.spacing = 4
        return st
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        SALG = view.safeAreaLayoutGuide
//setupGraphics()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
setupGraphics()
    }

    func setupGraphics() {
        let screenHeight: CGFloat = view.bounds.height
        let btnHeight: CGFloat = ((screenHeight / 2) - 8) / 3
print(screenHeight)
        print(btnHeight)
//Mark: buttons without stack
        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(btn3)
        NSLayoutConstraint.activate([
            btn1.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 8),
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 4),
            btn3.topAnchor.constraint(equalTo: btn2.bottomAnchor, constant: 4),
            btn1.heightAnchor.constraint(equalToConstant: btnHeight),
            btn2.heightAnchor.constraint(equalToConstant: btnHeight),
            btn3.heightAnchor.constraint(equalToConstant: btnHeight),
            btn1.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 5),
            btn2.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 5),
            btn3.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 5),
            btn1.widthAnchor.constraint(equalToConstant: 70),
            btn2.widthAnchor.constraint(equalToConstant: 70),
            btn3.widthAnchor.constraint(equalToConstant: 70),
        ])
//MARK: buttons in stack
        stack.addArrangedSubview(stackBtn1)
        stack.addArrangedSubview(stackBtn2)
        stack.addArrangedSubview(stackBtn3)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 5),
            stack.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -5),
            stack.widthAnchor.constraint(equalToConstant: 70),
            stack.heightAnchor.constraint(equalToConstant: screenHeight / 2),
        ])
    }
}
