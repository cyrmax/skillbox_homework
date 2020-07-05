import UIKit
import Alamofire

class ForecastVC: UITableViewController {
    var weathers = [WeatherResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
fetchWeather()
        tableView.dataSource = self
    }

    func fetchWeather() {
        let params: [String: Any] = [
            "id": cityID,
            "cnt": 7,
            "appid": apiKey
        ]



        AF.request("https://api.openweathermap.org/data/2.5/forecast/daily?id=\(cityID)&cnt=7&appid=\(apiKey)").validate().response {
response in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
print(data)

            }
        }
    }
}
