import UIKit

extension UIAlertController {
    static func errorAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive) {
            action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
return alert
    }
}
