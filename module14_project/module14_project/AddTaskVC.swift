import UIKit
import RealmSwift

class AddTaskVC: UIViewController {
let realm = try! Realm()
    override func loadView() {
        self.view = AddTaskView()
        self.title = "Add Task"
    }

    @objc func addTask() {
        let v = self.view as! AddTaskView
        guard let text = v.nameTF.text else {
            return
        }
let task = TodoTask()
        task.name = text
        try! realm.write {
            realm.add(task)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
