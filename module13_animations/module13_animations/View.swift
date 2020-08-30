import UIKit

class RootView: UIView {
    var guide: UILayoutGuide {
        self.safeAreaLayoutGuide
    }

    var squareYConstraint: NSLayoutConstraint!
    var squareXConstraint: NSLayoutConstraint!
    var squareWConstraint: NSLayoutConstraint!
    var squareHConstraint: NSLayoutConstraint!

    let square: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
return v
    }()

    let backBtn: UIButton = {
let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Previous", for: .normal)
        b.backgroundColor = .white
return b
    }()

    let nextBtn: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle("Next", for: .normal)
    b.backgroundColor = .white
    return b
    }()

    let numLbl: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .green
        lbl.text = "0"
return lbl
    }()

    let stack: UIStackView = {
let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
return st
    }()

    private func setupView() {
        self.backgroundColor = .black
addSubview(square)
        stack.addArrangedSubview(backBtn)
        stack.addArrangedSubview(numLbl)
        stack.addArrangedSubview(nextBtn)
addSubview(stack)

        squareXConstraint = square.centerXAnchor.constraint(equalTo: guide.leftAnchor, constant: (UIScreen.main.bounds.width / 2))
        squareYConstraint = square.centerYAnchor.constraint(equalTo: guide.topAnchor, constant: (UIScreen.main.bounds.height / 2))
        squareWConstraint = square.widthAnchor.constraint(equalToConstant: 200)
        squareHConstraint = square.heightAnchor.constraint(equalToConstant: 200)

        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: guide.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 50),
            stack.rightAnchor.constraint(equalTo: guide.rightAnchor),
            stack.heightAnchor.constraint(equalToConstant: 70),
squareXConstraint,
squareYConstraint,
squareWConstraint,
squareHConstraint
        ])

        backBtn.addTarget(nil, action: #selector(ViewController.previousAnimation), for: .touchUpInside)
        nextBtn.addTarget(nil, action: #selector(ViewController.nextAnimation), for: .touchUpInside)
    }

    func animateColor() {
        UIView.animate(withDuration: 2, animations: {
            self.square.backgroundColor = .yellow
        }, completion: {
isCompleted in
            self.square.backgroundColor = .red
        })
    }

    func animateMovement() {
        UIView.animate(withDuration: 2, animations: {
            self.squareXConstraint.constant = UIScreen.main.bounds.width - 100
            self.squareYConstraint.constant = 100
            self.layoutIfNeeded()
        }, completion: {
            isCompleted in
            self.squareXConstraint.constant = UIScreen.main.bounds.width / 2
            self.squareYConstraint.constant = UIScreen.main.bounds.height / 2
            self.layoutIfNeeded()
        })
    }

    func animateRound() {
let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = square.layer.cornerRadius
        animation.toValue = square.frame.size.width / 2
        animation.duration = 2
        square.layer.add(animation, forKey: "cornerRadius")
    }

    func animateSpin() {
        UIView.animate(withDuration: 2, animations: {
            self.square.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }, completion: {
            isCompleted in
            self.square.transform = CGAffineTransform(rotationAngle: 0)
        })
    }

    func animateDisappear() {
        UIView.animate(withDuration: 2, animations: {
            self.square.alpha = 0
        }, completion: {
            isCompleted in
            self.square.alpha = 1
        })
    }

    func animateScale() {
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse], animations: {
            self.square.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) {
isCompleted in
            self.square.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    func animateRotation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat], animations: {
            self.square.transform = CGAffineTransform(rotationAngle: 2 * CGFloat.pi)
        })
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
