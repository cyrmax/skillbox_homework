import UIKit

class ViewController: UIViewController {
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        var resourceURL = Bundle.main.resourceURL!
        resourceURL.appendPathComponent("pics")
        let fileArray = try! FileManager.default.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil, options: [])
        for file in fileArray {
            imageArray.append(UIImage(contentsOfFile: file.path)!)
        }
    }


}

