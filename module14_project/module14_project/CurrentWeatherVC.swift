import UIKit

let apiKey: String = "9851105cf1302262bbde4fd70207f687"
let cityID: String = "524901"
let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather"

class CurrentWeatherVC: UIViewController {
    var salg: UILayoutGuide {
        view.safeAreaLayoutGuide
    }

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
        setupGraphics()
        WeatherService.shared.fetchWeather() {
            result in
            switch result {
            case .success(let response):
                self.tempLbl.text! += response.main.temp.description
                self.windLbl.text! += response.wind.speed.description
            case .failure(let error):
break
//                self.present(UIAlertController.errorAlert(message: error.localizedDescription), animated: true)
            }
        }
    }

}

