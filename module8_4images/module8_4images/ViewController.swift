import UIKit

class ViewController: UIViewController {
    var imageArray: [UIImage] = []
    var imgViews = [UIImageView]()
var labels = [UILabel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
                var resourceURL = Bundle.main.resourceURL!
                resourceURL.appendPathComponent("pics")
                let fileArray = try! FileManager.default.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil, options: [])
                for file in fileArray {
                    imageArray.append(UIImage(contentsOfFile: file.path)!)
                }
        setupGraphics()
    }

    func setupGraphics() {
        for i in 0...3 {
let imgView = generateImageView(index: i)
            view.addSubview(imgView)
        }
    }

    func generateImageView(index: Int) -> UIView {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgView.image = imageArray[index]
        imgView.translatesAutoresizingMaskIntoConstraints = false
let label = UILabel()
        label.text = "Label \(index)"
        label.translatesAutoresizingMaskIntoConstraints = false
        imgView.addSubview(label)
        NSLayoutConstraint.activate([
        label.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: imgView.centerYAnchor)
])
        imgViews.append(imgView)
        labels.append(label)
return imgView
    }
}

