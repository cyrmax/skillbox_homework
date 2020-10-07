import UIKit
import CoreData

class bookListViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    var salg: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }

    var resultsController: NSFetchedResultsController<Book>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BookListCell.self, forCellReuseIdentifier: "bookListIdentifier")
        let request = NSFetchRequest<Book>(entityName: "Book")
        request.sortDescriptors = [NSSortDescriptor(key: "accessDate", ascending: false)]
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        resultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        resultsController.delegate = self
        do {
            try resultsController.performFetch()
        } catch {
            fatalError("Unable to initialize fetch controller \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return resultsController.sections!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = resultsController.sections else {
            fatalError("NO sections in results controller")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookListIdentifier", for: indexPath)
        let object = resultsController.object(at: indexPath)
        cell.textLabel?.text = object.name
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do {
            resultsController.managedObjectContext.delete(resultsController.object(at: indexPath))
                try resultsController.managedObjectContext.save()
//            tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                print(error)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = resultsController.object(at: indexPath)
        book.accessDate = Date()
        try? resultsController.managedObjectContext.save()
show(ReadBookViewController(), sender: self)
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            print("section move")
            break
        case .update:
            print("section update")
            break
        @unknown default: break
            }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        @unknown default: break
            }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: true)
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(title: "Все", style: .plain, target: self, action: #selector(showAllBooks)))
        items.append(UIBarButtonItem(title: "Непрочитанные", style: .plain, target: self, action: #selector(showUnreadBooks)))
        items.append(UIBarButtonItem(title: "Прочитанные", style: .plain, target: self, action: #selector(showReadBooks)))
        self.setToolbarItems(items, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
}
