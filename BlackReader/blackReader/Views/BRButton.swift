import UIKit

class BRButton: UIButton {
    private func setupView() {
        self.backgroundColor = .blue
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = frame.size.width / 2
        self.alpha = 0.7
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
}
