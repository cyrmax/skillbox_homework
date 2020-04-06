import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var leftOperandTF: UITextField!
    @IBOutlet weak var operationTF: UITextField!
    @IBOutlet weak var rightOperandTF: UITextField!
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let left = Double(leftOperandTF.text!), let right = Double(rightOperandTF.text!), let operationText = operationTF.text else {
            resultLabel.text = "Incorrect input"
            return
        }
        guard let operation = Operators(rawValue: operationText) else {
            resultLabel.text = "Calculation error"
            return
        }
        resultLabel.text = operation.apply(left, right).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    enum Operators: String {
        case add = "+"
        case sub = "-"
        case mul = "*"
        case dev = "/"
        func apply(_ a: Double, _ b: Double) -> Double {
            switch self {
            case .add:
                return a + b
            case .sub:
                return a - b
            case .mul:
                return a * b
            case .dev:
                return a / b
            }
        }
    }
}

