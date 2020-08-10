import UIKit


class ErrorAlertController: UIAlertController {


    convenience init(message: String) {
        self.init(title: "Error!", message: message, preferredStyle: .alert)
setupController()
    }

    private func setupController() {
        let action = UIAlertAction(title: "OK", style: .destructive) {
action in
            self.dismiss(animated: true, completion: nil)
        }
        self.addAction(action)
    }
}
