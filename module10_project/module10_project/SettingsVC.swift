import UIKit

class SettingsVC: UITableViewController {
    var cellArray: [[SettingsCellStruct]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
fillCellArray()
        tableView.rowHeight = 70
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return cellArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
        cell.accessoryType = .disclosureIndicator
        let obj = cellArray[indexPath.section][indexPath.row]
        cell.label.text = obj.label
        if obj.number != 0 {
            cell.numberLbl.text = obj.number.description
            cell.numberLbl.isHidden = false
        } else {
            cell.numberLbl.isHidden = true
        }
        cell.switcher.isHidden = !obj.needsSwitch
return cell
    }

    private func fillCellArray() {
        cellArray[0][0] = SettingsCellStruct(label: "Flightmode", needsSwitch: true)
        cellArray[0][1] = SettingsCellStruct(label: "Wi-fi: Cyrmax")
        cellArray[0][2] = SettingsCellStruct(label: "Bluetooth On")
        cellArray[0][3] = SettingsCellStruct(label: "Mobile network")
        cellArray[0][4] = SettingsCellStruct(label: "Mobile hotspot")
        cellArray[1][0] = SettingsCellStruct(label: "Notifications")
        cellArray[1][1] = SettingsCellStruct(label: "Sounds")
        cellArray[1][2] = SettingsCellStruct(label: "Do not desturb")
        cellArray[1][3] = SettingsCellStruct(label: "Screen time")
        cellArray[2][0] = SettingsCellStruct(label: "General", number: 2)
        cellArray[2][1] = SettingsCellStruct(label: "Controls")
        cellArray[2][2] = SettingsCellStruct(label: "Screen and brightness")
    }
}
