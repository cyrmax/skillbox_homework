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
        WeatherService.shared.fetchForecast() {
result in
            switch result {
            case .success(let response):
                self.weathers = response.list
                self.tableView.reloadData()
            case .failure(let error):
                self.present(UIAlertController.errorAlert(message: error.localizedDescription), animated: true)
            }
        }
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

}
