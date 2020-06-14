import UIKit

extension ViewController {
    func setupActions() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    @objc func segmentChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
            thirdView.isHidden = true
        case 2:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = false
        default:
            break
        }
    }

    func setupGraphics() {
        view.addSubview(segmentedControl)
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        NSLayoutConstraint.activate([
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
        segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
        segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
        segmentedControl.heightAnchor.constraint(equalToConstant: 45),
        firstView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
        firstView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
        firstView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
        firstView.heightAnchor.constraint(equalToConstant: 300),
        secondView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
        secondView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
        secondView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
        secondView.heightAnchor.constraint(equalToConstant: 300),
        thirdView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
        thirdView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
        thirdView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
        thirdView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
