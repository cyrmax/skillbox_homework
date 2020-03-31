import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var leftOperandTF: UITextField!
    @IBOutlet weak var operationTF: UITextField!
    @IBOutlet weak var rightOperandTF: UITextField!

    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let left = Double(leftOperandTF.text!), let right = Double(rightOperandTF.text!), let operation = operationTF.text else {
            resultLabel.text = "Incorrect input"
            return
        }
        guard let result = calculate(left, right, operation) else {
            resultLabel.text = "Calculation error"
            return
        }
        resultLabel.text = result.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func calculate(_ left: Double, _ right: Double, _ operation: String) -> Double? {
        switch operation {
        case "+":
            return left + right
        case "-":
            return left - right
        case "*":
            return left * right
        case "/":
            return left / right
        default:
            return nil
        }
    }
}

