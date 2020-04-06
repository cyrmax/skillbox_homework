import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func numberEditingChanged(_ sender: Any) {
        guard let number = Int(numberTextField.text!) else {
            resultLabel.text = "Incorrect data"
            return
        }
        resultLabel.text = calculate(number)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func calculate(_ n: Int) -> String {
        var result: Double = 1
        for _ in 0..<n {
            result *= 2
        }
        return result.description
    }
}

