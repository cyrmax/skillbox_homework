import UIKit

class SliderView: UIView {
    var minValue: Float = 0
    var maxValue: Float = 1
    var value: Float = 0 {
        didSet {
            switch self.isPercentage {
            case false:
                self.accessibilityValue = Int(value).description
            case true:
                self.accessibilityValue = "\(Int(value * 100))%"
            }
        }
    }
    weak var delegate: SliderViewDelegate?
    var isPercentage: Bool = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
setupView()
    }

    private func setupView() {
        self.accessibilityTraits = [.adjustable]
        self.isAccessibilityElement = true
        backgroundColor = .white
        alpha = 0.9
    }

    override func accessibilityDecrement() {
        if value > minValue {
            delegate?.valueDecremented(self)
        }
    }

    override func accessibilityIncrement() {
        if value < maxValue {
            delegate?.valueIncremented(self)
        }
    }

    func setValue(_ value: Float) {
        self.value = value
    }
}


protocol SliderViewDelegate: NSObject {
    func valueIncremented(_ sender: SliderView)
    func valueDecremented(_ sender: SliderView)
}
