import UIKit

class ForecastVC: UITableViewController {
    var weathers = [WeatherResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self

    }
}
