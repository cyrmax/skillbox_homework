import UIKit

class CollectionVC: UICollectionViewController {
    var imageArray: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
    }


}
