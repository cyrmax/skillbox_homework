import CoreData
import Foundation

extension NSEntityDescription {
    func addAttribute(name: String, type: NSAttributeType, isOptional: Bool = false) {
let property = NSAttributeDescription(name: name, type: type, isOptional: isOptional)
        self.properties.append(property)
    }
    func addRelationship(name: String, destination: NSEntityDescription, isOptional: Bool = false, minCount: Int = 1, maxCount: Int = 1) {
let relation = NSRelationshipDescription(name: name, destination: destination, isOptional: isOptional, minCount: minCount, maxCount: maxCount)
        self.properties.append(relation)
    }
}

extension NSEntityDescription {
    convenience init(from className: AnyClass) {
        self.init()
        name = NSStringFromClass(className)
managedObjectClassName = NSStringFromClass(className)
    }
}

extension NSAttributeDescription {
    convenience init(name: String, type: NSAttributeType, isOptional: Bool = false) {
        self.init()
        self.name = name
        self.attributeType = type
        self.isOptional = isOptional
    }
}


extension NSRelationshipDescription {
    convenience init(name: String, destination: NSEntityDescription, isOptional: Bool = false, minCount: Int = 1, maxCount: Int = 1) {
        self.init()
        self.name = name
        self.destinationEntity = destination
        self.isOptional = isOptional
        self.minCount = minCount
        self.maxCount = maxCount
    }
}

@objc(Author)
public class Author: NSManagedObject {
    @NSManaged var firstname: String?
    @NSManaged var lastname: String?
    @NSManaged var nickname: String?
    @NSManaged var email: String?
}

@objc(Genre)
public class Genre: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var match: Int
}

@objc(TitleInfo)
public class TitleInfo: NSManagedObject {
    @NSManaged var bookTitle: String
    @NSManaged var author: Author
    @NSManaged var genres: Set<Genre>
}


@objc(Description)
public class Description: NSManagedObject {
    @NSManaged var titleInfo: TitleInfo
}


