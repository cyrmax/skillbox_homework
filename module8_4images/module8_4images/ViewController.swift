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
        var x: CGFloat = 0
        var y: CGFloat = -105
        for i in 0...3 {
            if i % 2 == 0 {
x = 0
y += 105
            } else {
x = 105
            }
            view.addSubview(generateImageView(x: x, y: y, index: i))
        }
    }

    func generateImageView(x: CGFloat, y: CGFloat, index: Int) -> UIView {
        let imgView = UIImageView(frame: CGRect(x: x, y: y, width: 100, height: 100))
        imgView.image = imageArray[index]
//        imgView.translatesAutoresizingMaskIntoConstraints = false
let label = UILabel()
        label.text = "Label \(index)"
//        label.translatesAutoresizingMaskIntoConstraints = false
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

