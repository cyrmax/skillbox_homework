import UIKit
import Alamofire

class ForecastVC: UITableViewController {
    var weathers = [WeatherResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
fetchWeather()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = weathers[indexPath.row].description
return cell
    }

    func fetchWeather() {
        let params: [String: Any] = [
            "id": cityID,
            "cnt": 7,
            "appid": apiKey
        ]



        AF.request("https://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&appid=\(apiKey)").validate().response {
response in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
let decoder = JSONDecoder()
guard let decoded = try? decoder.decode(ForecastResponse.self, from: data!) else {
    print("decoding error")
    return
                }

//print(decoded)
self.weathers = decoded.list
DispatchQueue.main.sync {
    self.tableView.reloadData()
                }
            }
        }
    }
}
