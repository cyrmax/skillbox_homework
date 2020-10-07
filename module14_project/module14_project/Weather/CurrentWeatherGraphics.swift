import UIKit

extension CurrentWeatherVC {
    func setupGraphics() {
        view.addSubview(tempLbl)
        view.addSubview(windLbl)
        NSLayoutConstraint.activate([
            tempLbl.topAnchor.constraint(equalTo: salg.topAnchor, constant: 100),
            tempLbl.centerXAnchor.constraint(equalTo: salg.centerXAnchor),
            windLbl.topAnchor.constraint(equalTo: tempLbl.bottomAnchor, constant: 20),
            windLbl.centerXAnchor.constraint(equalTo: salg.centerXAnchor)
        ])
    }
}
