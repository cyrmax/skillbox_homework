import UIKit

class ExpandTextVC: UIViewController {
    var SALG: UILayoutGuide!
    let btn: UIButton = {
let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Expand / Collapse", for: .normal)
return btn
    }()

    let label: UILabel = {
let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = """
first line of text in label
second line of text in label
third line
fourth line
and last line of big text
"""
        lbl.numberOfLines = 1
return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        SALG = view.safeAreaLayoutGuide
setupGraphics()
        btn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }

    func setupGraphics() {
        view.addSubview(btn)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: SALG.topAnchor, constant: 20),
            btn.centerXAnchor.constraint(equalTo: SALG.centerXAnchor),
            label.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: SALG.centerXAnchor),
        ])
    }

    @objc func btnPressed() {
        if label.numberOfLines == 1 {
            label.numberOfLines = 5
        } else {
            label.numberOfLines = 1
        }
    }
}
