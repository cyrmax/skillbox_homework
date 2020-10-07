import Foundation
import UIKit
import CoreData

extension mainScreenViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        openBook(urls.first!)
        show(ReadBookViewController(), sender: self)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        let alert = UIAlertController(title: "Внимание!", message: "Вы не выбрали книгу", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Похер!", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
