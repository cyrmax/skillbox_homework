import UIKit
import RealmSwift

let apiKey: String = "9851105cf1302262bbde4fd70207f687"
let cityID: String = "524901"
let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather"

class CurrentWeatherVC: UIViewController {
    var salg: UILayoutGuide {
        view.safeAreaLayoutGuide
    }

let realm = try! Realm()

    let tempLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Current temperature: "
        lbl.backgroundColor = .green
        return lbl
    }()

    let windLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Wind speed: "
        lbl.backgroundColor = .blue
        return lbl
    }()

    let descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
title = "Weather"
        setupGraphics()

        if let cachedWeather = realm.objects(WeatherResponse.self).first {
        self.tempLbl.text! = "Current temperature: " + cachedWeather.main!.temp.description
        self.windLbl.text! = "Wind speed: " + cachedWeather.wind!.speed.description
        }

        WeatherService.shared.fetchWeather() {
            result in
            switch result {
            case .success(let response):
                self.tempLbl.text! = "Current temperature: " + response.main!.temp.description
                self.windLbl.text! = "Wind speed: " + response.wind!.speed.description
            case .failure(let error):
break
//                self.present(UIAlertController.errorAlert(message: error.localizedDescription), animated: true)
            }
        }
    }

}

