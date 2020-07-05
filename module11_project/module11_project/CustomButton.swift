import UIKit

@IBDesignable
class CustomButton: UIButton {
@IBInspectable
    var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
            layoutIfNeeded()
        }
    }

@IBInspectable
    var borderWidth: Float {
        get {
            return Float(layer.borderWidth)
        }
        set {
            layer.borderWidth = CGFloat(newValue)
            layoutIfNeeded()
        }
    }

    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
            layoutIfNeeded()
        }
    }
}
