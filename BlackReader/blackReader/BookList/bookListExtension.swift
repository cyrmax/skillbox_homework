import Foundation

extension bookListViewController {
    @objc func showAllBooks() {
        resultsController.fetchRequest.predicate = nil
        do {
            try resultsController.performFetch()
            tableView.reloadData()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }

    @objc func showUnreadBooks() {
        resultsController.fetchRequest.predicate = NSPredicate(format: "isRead == %@", false as NSNumber)
        do {
            try resultsController.performFetch()
            tableView.reloadData()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }

    @objc func showReadBooks() {
        resultsController.fetchRequest.predicate = NSPredicate(format: "isRead == %@", true as NSNumber)
        do {
            try resultsController.performFetch()
            tableView.reloadData()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
}
