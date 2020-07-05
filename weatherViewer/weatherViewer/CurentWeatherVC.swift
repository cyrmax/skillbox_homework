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
        fetchWeather()
    }

    func fetchWeather() {
        URLSession.shared.dataTask(with: URL(string: apiUrl + "?id=" + cityID + "&appid=" + apiKey)!, completionHandler: {
data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
guard
let data = data,
let response = response as? HTTPURLResponse,
    response.statusCode == 200
else { return }

let decoder = JSONDecoder()
            do {
            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                DispatchQueue.main.sync {
                self.tempLbl.text! += weatherResponse.main.temp.description
                self.windLbl.text! += weatherResponse.wind.speed.description
                }
            } catch {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
