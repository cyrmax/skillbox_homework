import UIKit

class LabelsVC: UIViewController {
    var SALG: UILayoutGuide!
    let smallStr: String = "Short text"
    let bigStr: String = "Very very long text without any sense. And another sentence"

    let leftLabel: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
return lbl
    }()

    let rightLabel: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        return lbl
    }()

    let leftBtn: UIButton = {
let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Left btn", for: .normal)
return btn
    }()

    let rightBtn: UIButton = {
let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("right btn", for: .normal)
return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        SALG = view.safeAreaLayoutGuide
        setupGraphics()
        leftBtn.addTarget(self, action: #selector(leftBtnPressed), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(rightBtnPressed), for: .touchUpInside)
    }


    func setupGraphics() {
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
        view.addSubview(leftBtn)
        view.addSubview(rightBtn)
let rightLabelConstraint =             rightLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40)
        rightLabelConstraint.priority = UILayoutPriority(rawValue: 1000)
        NSLayoutConstraint.activate([
            leftBtn.topAnchor.constraint(equalTo: leftLabel.bottomAnchor, constant: 20),
            leftBtn.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 10),
            rightBtn.topAnchor.constraint(equalTo: rightLabel.bottomAnchor, constant: 20),
            rightBtn.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -10),
            leftLabel.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 20),
            rightLabel.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 20),
            leftLabel.heightAnchor.constraint(equalToConstant: 50),
            rightLabel.heightAnchor.constraint(equalToConstant: 50),
            leftLabel.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 8),
            rightLabel.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -8),
            rightLabel.leftAnchor.constraint(equalTo: leftLabel.rightAnchor, constant: 8),
rightLabelConstraint,
        ])
        leftLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }

    @objc func leftBtnPressed() {
        if leftLabel.text?.count == smallStr.count {
            leftLabel.text = bigStr
        } else {
            leftLabel.text = smallStr
        }
    }

    @objc func rightBtnPressed() {
        if rightLabel.text?.count == smallStr.count {
            rightLabel.text = bigStr
        } else {
            rightLabel.text = smallStr
        }
    }
}
