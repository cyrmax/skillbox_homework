import UIKit

class SettingsViewController: UIViewController {

    override func loadView() {
        view = SettingsView()
    }

    @objc func voicesPressed() {
show(selectVoiceViewController(), sender: self)
    }

    @objc func vkPressed() {
        UIApplication.shared.open(URL(string: "https://vk.com/cyrmax_blog")!)
    }
}
