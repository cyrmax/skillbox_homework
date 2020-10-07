import CoreData


@objc(Book)
public class Book: NSManagedObject {
    @NSManaged public var accessDate: Date
    @NSManaged public var author: String?
    @NSManaged public var bookmark: Int
    @NSManaged public var hashInt: String
    @NSManaged public var name: String
    @NSManaged public var isRead: Bool
    @NSManaged public var sentences: NSMutableOrderedSet
}


@objc(Sentence)
public class Sentence: NSManagedObject {
    @NSManaged public var text: String
    @NSManaged public var pageNumber: Int
    @NSManaged public var book: Book
}
