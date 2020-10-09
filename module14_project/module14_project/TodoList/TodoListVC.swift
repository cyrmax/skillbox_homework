import UIKit
import RealmSwift


class TodoListVC: UITableViewController {
let realm = try! Realm()
    var tasks: Results<TodoTask>!
    var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task list"
        tasks = realm.objects(TodoTask.self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 70
        tableView.reloadData()
        token = realm.observe {
 _, _ in
            self.tableView.reloadData()
        }

let addBtn = UIButton()
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle("Add", for: .normal)
        addBtn.backgroundColor = .red
        view.addSubview(addBtn)
        NSLayoutConstraint.activate([
            addBtn.heightAnchor.constraint(equalToConstant: 50),
            addBtn.widthAnchor.constraint(equalToConstant: 50),
            addBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
        addBtn.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
    }

    @objc func addNewTask() {
        present(AddTaskVC(), animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].name
return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            try! realm.write {
                realm.delete(tasks[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        default: break
        }
    }
}
