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


