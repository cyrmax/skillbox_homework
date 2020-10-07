import Foundation
import BookKit
import UIKit.UIApplication


func openFB2Book(data: Data) {
let parser = FB2Parser()
    guard let book = parser.parse(from: data) else { return }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
let tempBook = Book(context: context)
    tempBook.name = book.titleInfo.title ?? "No title"
    tempBook.accessDate = Date()
    for part in book.body.parts {
        for sentence in part.sentences {
let s = Sentence(context: context)
            s.text = sentence.text
            s.pageNumber = sentence.pageNumber
            tempBook.addToSentences(s)
        }
    }
    do {
        try context.save()
    }
    catch {
        print(error.localizedDescription)
    }
}
