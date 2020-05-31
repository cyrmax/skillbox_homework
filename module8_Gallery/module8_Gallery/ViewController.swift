import UIKit

class ViewController: UIViewController {
    var imageArray = [UIImage]()
    let imgView: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.contentMode = .scaleAspectFit
        return imv
    }()

    let backBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let forwardBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Forward", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

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
        imgView.image = imageArray[0]
    }


    func setupGraphics() {
        view.addSubview(imgView)
        stack.addArrangedSubview(backBtn)
        stack.addArrangedSubview(forwardBtn)
        view.addSubview(stack)
        imgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        stack.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 50).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

