import UIKit

class RootView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.alpha = 0.5
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .blue
    }
}
