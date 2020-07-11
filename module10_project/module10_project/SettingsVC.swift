import UIKit

class SettingsVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
return 5
        case 1:
return 4
        case 2:
return 3
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
        cell.setupView()
        cell.accessoryType = .disclosureIndicator
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            cell.label.text = "Авиарежим"
            cell.switcher.isHidden = false
            cell.accessoryType = .none
        case (0, 1):
            cell.label.text = "Wi-fi: Cyrmax"
        case (0, 2):
            cell.label.text = "Bluetooth On"
        case (0, 3):
            cell.label.text = "Сотовая связь"
        case (0, 4):
            cell.label.text = "Режим модема"
        case (1, 0):
            cell.label.text = "Уведомления"
        case (1, 1):
            cell.label.text = "Звуки, тактильные сигналы"
        case (1, 2):
            cell.label.text = "Не беспокоить"
        case (1, 3):
            cell.label.text = "Экранное время"
        case (2, 0):
            cell.label.text = "Основные"
            cell.numberLbl.isHidden = false
            cell.numberLbl.text = "2"
        case (2, 1):
            cell.label.text = "Пункт управления"
        case (2, 2):
            cell.label.text = "Экран и яркость"
        default: break
        }
return cell
    }
}
