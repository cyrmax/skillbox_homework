import Foundation
import CoreData
import AVFoundation
import UIKit.UIApplication


class BookManager {
    var book: Book!
    var bookIsLoaded = false
    var delegate: BookManagerDelegate?
    let context: NSManagedObjectContext

    init() {
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

    func loadLastBook() {
        let request = NSFetchRequest<Book>(entityName: "Book")
        request.sortDescriptors = [NSSortDescriptor(key: "accessDate", ascending: false)]
        do {
            let results = try context.fetch(request)
            guard !results.isEmpty else {
                delegate?.noBooksFound()
                return
            }
            book = results[0]
bookIsLoaded = true
returnBookInfo()
            delegate?.bookOpened()
        }
        catch {
            delegate?.bookOpenErrorOccured(error: error)
        }
    }

    func returnBookInfo() {
        delegate?.setBookTitle(title: book.name)
returnBookPosition()
    }

    func nextSentence() -> AVSpeechUtterance? {
        let newBookmark = book.bookmark + 1
        guard newBookmark < book.sentences.count - 2 else {
return nil
        }
        guard let sentence = book.sentences.object(at: newBookmark) as? Sentence else {
return nil
        }
        book.bookmark = newBookmark
        do {
            try context.save()
returnBookPosition()
        }
        catch {
            delegate?.readingErrorOccured(error: error)
        }
        return makeUtterance(string: sentence.text)
    }

    func previousSentence() -> AVSpeechUtterance? {
                var newBookmark = book.bookmark - 1
        if newBookmark < 0 {
            newBookmark = 0
        }
                guard let sentence = book.sentences.object(at: newBookmark) as? Sentence else {
        return nil
                }
                book.bookmark = newBookmark
                do {
                    try context.save()
returnBookPosition()
                }
                catch {
                    delegate?.readingErrorOccured(error: error)
                }
                return makeUtterance(string: sentence.text)
    }

    func getSentence() -> AVSpeechUtterance? {
        guard let sentence = book.sentences.object(at: book.bookmark) as? Sentence else {
                return nil
                        }
                        return makeUtterance(string: sentence.text)
    }

    func makeUtterance(string: String) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = SettingsManager.shared.preferedVoice
        utterance.rate = SettingsManager.shared.speechRate
        utterance.pitchMultiplier = SettingsManager.shared.speechPitch
        utterance.volume = SettingsManager.shared.speechVolume
return utterance
    }

    func returnBookPosition() {
        delegate?.setBookPosition(position: Float(book.bookmark) / Float(book.sentences.count))
    }

    func goToStart() {
        book.bookmark = 0
        do {
            try context.save()
returnBookPosition()
        }
        catch {
            delegate?.readingErrorOccured(error: error)
        }
    }

    func goTOEnd() {
        book.bookmark = book.sentences.count - 2
        do {
            try context.save()
returnBookPosition()
        }
        catch {
            delegate?.readingErrorOccured(error: error)
        }
    }

    func fastForward() {
        let newBookmark = book.bookmark + 20
        guard newBookmark < book.sentences.count - 1 else {
returnBookPosition()
            return
        }
        book.bookmark = newBookmark
        do {
            try context.save()
        }
        catch {
            delegate?.readingErrorOccured(error: error)
        }
        returnBookPosition()
    }

    func fastBack() {
        var newBookmark = book.bookmark - 20
        if newBookmark < 0 {
            newBookmark = 0
        }
        book.bookmark = newBookmark
        do {
            try context.save()
        }
        catch {
            delegate?.readingErrorOccured(error: error)
        }
returnBookPosition()
    }

    func goForward() {
                let newBookmark = book.bookmark + 1
                guard newBookmark < book.sentences.count - 1 else {
        returnBookPosition()
                    return
                }
                book.bookmark = newBookmark
                do {
                    try context.save()
                }
                catch {
                    delegate?.readingErrorOccured(error: error)
                }
                returnBookPosition()
    }

    func goBack() {
                var newBookmark = book.bookmark - 1
                if newBookmark < 0 {
                    newBookmark = 0
                }
                book.bookmark = newBookmark
                do {
                    try context.save()
                }
                catch {
                    delegate?.readingErrorOccured(error: error)
                }
        returnBookPosition()
    }
}


protocol BookManagerDelegate {
func bookOpened()
    func bookOpenErrorOccured(error: Error)
    func readingErrorOccured(error: Error)
func noBooksFound()
    func setBookTitle(title: String)
    func setBookPosition(position: Float)
}
