import Foundation
import UIKit
import CoreData
import BookKit

func openBook(_ url: URL) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            var tempBook: Book!
            var str = ""
            do {
                CFURLStartAccessingSecurityScopedResource(url as CFURL)
                let data = try Data(contentsOf: url)
                switch url.pathExtension {
                case "txt":
                    str = try String(contentsOf: url)
                case "rtf":
                    let nas = try NSAttributedString(data: data, options: [:], documentAttributes: nil)
                    str = nas.string
                case "htm", "html":
                    let nas = try NSAttributedString(data: data, options: [:], documentAttributes: nil)
                    str = nas.string
                case "fb2":
                    openFB2Book(data: data)
return
                default:
    return
                }
                CFURLStopAccessingSecurityScopedResource(url as CFURL?)
                let hash = String(data.hashValue)
                let request = NSFetchRequest<Book>(entityName: "Book")
                request.predicate = NSPredicate(format: "hashInt == %@", hash)
                let results = try context.fetch(request)
                if let b = results.first {
                    tempBook = b
                }
                else {
                    tempBook = Book(context: context)
                    tempBook.name = url.lastPathComponent
                    tempBook.hashInt = hash
                    let sentences = str.splitToSentences()
var page = 1
                    var pageCounter = 0
                    for item in sentences {
                        let sentence = Sentence(context: context)
                        sentence.text = item
                        sentence.pageNumber = page
                        if pageCounter >= 19 {
page += 1
pageCounter = 0
                        }
pageCounter += 1
                        tempBook.addToSentences(sentence)
                    }
                }
                tempBook.accessDate = Date()
                try context.save()
            }
            catch {
                print(error.localizedDescription)
            }
}
