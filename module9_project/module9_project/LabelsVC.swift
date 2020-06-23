import UIKit

class LabelsVC: UIViewController {
    var SALG: UILayoutGuide!
    let leftLabel: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Left label with a lots of some strange and big text"
return lbl
    }()

    let rightLabel: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Right label"
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        SALG = view.safeAreaLayoutGuide
        setupGraphics()
    }

    func setupGraphics() {
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
let rightLabelConstraint =             rightLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40)
        rightLabelConstraint.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 20),
            rightLabel.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 20),
            leftLabel.heightAnchor.constraint(equalToConstant: 50),
            rightLabel.heightAnchor.constraint(equalToConstant: 50),
            leftLabel.leftAnchor.constraint(equalTo: SALG.leftAnchor, constant: 8),
            rightLabel.rightAnchor.constraint(equalTo: SALG.rightAnchor, constant: -8),
            rightLabel.leftAnchor.constraint(equalTo: leftLabel.rightAnchor, constant: 8),
rightLabelConstraint,

        ])
    }
}
