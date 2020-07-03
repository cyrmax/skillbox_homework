import UIKit

class CollectionVC: UIViewController {
    var imageArray: [UIImage] = []
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
print("Collection controller loaded")
        var url = Bundle.main.resourceURL!
        url.appendPathComponent("pics")
        let fileArray = try! FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
        for file in fileArray {
            imageArray.append(UIImage(contentsOfFile: file.path)!)
        }
        print("images loaded: \(imageArray.count)")

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
    }


}
