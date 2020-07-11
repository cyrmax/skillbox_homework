import UIKit
import Foundation

class CollectionVC: UIViewController {
    var imageArray: [UIImage] = []
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.5))
let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
let section = NSCollectionLayoutSection(group: group)
let layout = UICollectionViewCompositionalLayout(section: section)


        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
print("Collection controller loaded")
        var url = Bundle.main.resourceURL!
        url.appendPathComponent("pics")
        let fileArray = try! FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
        for file in fileArray {
            imageArray.append(UIImage(contentsOfFile: file.path)!)
        }
        print("images loaded: \(imageArray.count)")
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
    }


}
