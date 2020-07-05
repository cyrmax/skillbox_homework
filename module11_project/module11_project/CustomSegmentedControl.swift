import UIKit

@IBDesignable
class CustomSegmentedControl: UIView {
    weak var delegate: CustomSegmentedControlDelegate?
    var salg: UILayoutGuide {
        return safeAreaLayoutGuide
    }

@IBInspectable
    var leftSegmentString: String {
        get {
            return sc.titleForSegment(at: 0)!
        }
        set {
            self.setTitle(newValue, for: .left)
layoutIfNeeded()
        }
    }

    @IBInspectable
    var rightSegmentString: String {
        get {
            return sc.titleForSegment(at: 1)!
        }
        set {
            self.setTitle(newValue, for: .right)
            layoutIfNeeded()
        }
    }

@IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: sc.layer.borderColor!)
        }
        set {
            sc.layer.borderColor = newValue.cgColor
            layoutIfNeeded()
        }
    }
    
    private let sc: UISegmentedControl  = {
        let s = UISegmentedControl(items: ["First", "second"])
        s.translatesAutoresizingMaskIntoConstraints = false
return s
    }()

    enum Segments: Int {
case left, right
    }

    func setTitle(_ title: String, for segment: Segments) {
            sc.setTitle(title, forSegmentAt: segment.rawValue)
    }

    private func setupView() {
addSubview(sc)
        NSLayoutConstraint.activate([
            sc.leftAnchor.constraint(equalTo: salg.leftAnchor),
            sc.rightAnchor.constraint(equalTo: salg.rightAnchor),
            sc.topAnchor.constraint(equalTo: salg.topAnchor),
            sc.bottomAnchor.constraint(equalTo: salg.bottomAnchor)
        ])
        sc.addTarget(self, action: #selector(scChangedValue), for: .valueChanged)
    }

    @objc func scChangedValue() {
        delegate?.customSegmentedControlDidChangeSelection(sc.selectedSegmentIndex)
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


protocol CustomSegmentedControlDelegate: NSObject {
    func customSegmentedControlDidChangeSelection(_ selectedIndex: Int)
}
