import UIKit

class CollectionViewCell: UICollectionViewCell {
    var salg: UILayoutGuide {
        return self.safeAreaLayoutGuide
    }

    let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isAccessibilityElement = true
        img.accessibilityTraits = [.image]
        return img
    }()

    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private func setupView() {
addSubview(image)
addSubview(label)
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: salg.leftAnchor),
            image.rightAnchor.constraint(equalTo: salg.rightAnchor),
            image.topAnchor.constraint(equalTo: salg.topAnchor),
            image.bottomAnchor.constraint(equalTo: salg.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: salg.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: salg.centerYAnchor)
        ])
    }
}
