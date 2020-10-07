import UIKit
import MobileCoreServices

extension mainScreenViewController {
    @objc func lastBook() {
show(ReadBookViewController(), sender: self)
    }

    @objc func openNew() {
let docTypes = ["public.text", "com.microsoft.word.doc", "public.item"]
        let picker = UIDocumentPickerViewController(documentTypes: docTypes, in: .open)
        picker.delegate = self
        picker.allowsMultipleSelection = false
        present(picker, animated: true, completion: nil)
    }

    @objc func openBookList() {
show(bookListViewController(), sender: self)
    }

    @objc func openSettings() {
show(SettingsViewController(), sender: self)
    }
}
