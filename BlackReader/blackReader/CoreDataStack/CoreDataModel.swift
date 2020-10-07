import CoreData

extension AppDelegate {
var bookModel: NSManagedObjectModel {
let model = NSManagedObjectModel()

    let book = NSEntityDescription(from: Book.self)
    let sentence = NSEntityDescription(from: Sentence.self)
    book.addAttribute(name: "accessDate", type: .dateAttributeType)
    book.addAttribute(name: "author", type: .stringAttributeType, isOptional: true)
    book.addAttribute(name: "bookmark", type: .integer64AttributeType, defaultValue: 0)
    book.addAttribute(name: "hashInt", type: .stringAttributeType)
    book.addAttribute(name: "isRead", type: .booleanAttributeType, defaultValue: false)
    book.addAttribute(name: "name", type: .stringAttributeType)
    sentence.addAttribute(name: "pageNumber", type: .integer64AttributeType)
    sentence.addAttribute(name: "text", type: .stringAttributeType)
    let sentencesRelation = NSRelationshipDescription(name: "sentences", destination: sentence, minCount: 0, maxCount: 0, deleteRule:  .cascadeDeleteRule)
let bookRelation = NSRelationshipDescription(name: "book", destination: book)
    sentencesRelation.inverseRelationship = bookRelation
    bookRelation.inverseRelationship = sentencesRelation
    book.addProperty(sentencesRelation)
    sentence.addProperty(bookRelation)
    book.uniquenessConstraints = [["hashInt"]]

    model.entities = [book, sentence]
return model
}
}
