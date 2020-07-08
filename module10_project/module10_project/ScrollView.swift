import UIKit


class ScrollView: UIScrollView {
    var salg: UILayoutGuide {
        return self.contentLayoutGuide
    }

    let view1: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .orange
        return v
    }()

    let view2: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        return v
    }()

    let view3: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .yellow
        return v
    }()

    let view4: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()

    private func setupView() {
//        contentSize = CGSize(width: self.frame.size.width, height: 2000)
addSubview(view1)
addSubview(view2)
        addSubview(view3)
        addSubview(view4)
        NSLayoutConstraint.activate([
            view1.leftAnchor.constraint(equalTo: salg.leftAnchor),
            view1.topAnchor.constraint(equalTo: salg.topAnchor),
            view1.widthAnchor.constraint(equalToConstant: 150),
            view1.heightAnchor.constraint(equalToConstant: 400),
            view2.leftAnchor.constraint(equalTo: view1.rightAnchor, constant: 20),
            view2.topAnchor.constraint(equalTo: salg.topAnchor),
            view2.widthAnchor.constraint(equalToConstant: 150),
            view2.heightAnchor.constraint(equalToConstant: 400),
            view3.leftAnchor.constraint(equalTo: salg.leftAnchor),
            view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20),
            view3.widthAnchor.constraint(equalToConstant: 150),
            view3.heightAnchor.constraint(equalToConstant: 400),
            view4.leftAnchor.constraint(equalTo: view3.rightAnchor, constant: 20),
            view4.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 20),
            view4.widthAnchor.constraint(equalToConstant: 150),
            view4.heightAnchor.constraint(equalToConstant: 400),
//            view4.bottomAnchor.constraint(equalTo: salg.bottomAnchor)
        ])
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
