import CoreData
import Foundation


extension NSEntityDescription {
    func addProperty(_ property: NSPropertyDescription) {
        self.properties.append(property)
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


@objc(AuthorMO)
public class AuthorMO: NSManagedObject {
    @NSManaged var firstname: String?
    @NSManaged var lastname: String?
    @NSManaged var nickname: String?
    @NSManaged var email: String?

    static private var _entityDescription: NSEntityDescription?
    static func entityDescription() -> NSEntityDescription {
        if let _ = self._entityDescription {
            return self._entityDescription!
        }
let des = NSEntityDescription(from: self)
        des.addProperty(NSAttributeDescription(name: "firstname", type: .stringAttributeType, isOptional: true))
        des.addProperty(NSAttributeDescription(name: "lastname", type: .stringAttributeType, isOptional: true))
        des.addProperty(NSAttributeDescription(name: "nickname", type: .stringAttributeType, isOptional: true))
        des.addProperty(NSAttributeDescription(name: "email", type: .stringAttributeType, isOptional: true))
        self._entityDescription = des
        return self._entityDescription!
    }
}


@objc(GenreMO)
public class GenreMO: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var match: Int

        static private var _entityDescription: NSEntityDescription?
        static func entityDescription() -> NSEntityDescription {
            if let _ = self._entityDescription {
                return self._entityDescription!
            }
    let des = NSEntityDescription(from: self)
            des.addProperty(NSAttributeDescription(name: "name", type: .stringAttributeType))
            des.addProperty(NSAttributeDescription(name: "match", type: .integer16AttributeType))
            self._entityDescription = des
            return self._entityDescription!
        }
}


@objc(TitleInfoMO)
public class TitleInfoMO: NSManagedObject {
    @NSManaged var bookTitle: String
    @NSManaged var author: AuthorMO

    static var _entityDescription: NSEntityDescription?
        static func entityDescription() -> NSEntityDescription {
            if let _ = self._entityDescription {
                return self._entityDescription!
            }
    let des = NSEntityDescription(from: self)
            des.addProperty(NSAttributeDescription(name: "bookTitle", type: .stringAttributeType))
            des.addProperty(NSRelationshipDescription(name: "author", destination: AuthorMO.entityDescription()))
            self._entityDescription = des
            return self._entityDescription!
        }
}


