import UIKit

extension ReadBookViewController: BookManagerDelegate {
    func bookOpened() {
        dView.pauseBtn.isEnabled = true
        dView.moveSlider.maxValue = Float(bookManager.book.sentences.count)
setPlayingInfo()
    }

    func bookOpenErrorOccured(error: Error) {
        presentAlert(with: "An error occured while opening book: \(error.localizedDescription)")
    }

    func readingErrorOccured(error: Error) {
        presentAlert(with: "An error occured while reading: \(error.localizedDescription)")
    }

    func noBooksFound() {
presentAlert(with: "Нет открытых книг")
    }

    func setBookTitle(title: String) {
        self.title = title
    }

    func setBookPosition(position: Float) {
        self.dView.moveSlider.setValue(position)
setPlayingInfo()
    }

    func presentAlert(with text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    }
}
