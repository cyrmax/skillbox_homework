import CoreData

extension NSEntityDescription {
    func addAttribute(name: String, type: NSAttributeType, isOptional: Bool = false, defaultValue: Any? = nil) {
let property = NSAttributeDescription(name: name, type: type, isOptional: isOptional, defaultValue: defaultValue)
        self.properties.append(property)
    }

    func addRelationship(name: String, destination: NSEntityDescription, isOptional: Bool = false, minCount: Int = 1, maxCount: Int = 1, deleteRule: NSDeleteRule = .noActionDeleteRule, isOrdered: Bool = true) {
let relation = NSRelationshipDescription(name: name, destination: destination, isOptional: isOptional, minCount: minCount, maxCount: maxCount, deleteRule: deleteRule)
        self.properties.append(relation)
    }

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
    convenience init(name: String, type: NSAttributeType, isOptional: Bool = false, defaultValue: Any? = nil) {
        self.init()
        self.name = name
        self.attributeType = type
        self.isOptional = isOptional
        self.defaultValue = defaultValue
    }
}


extension NSRelationshipDescription {
    convenience init(name: String, destination: NSEntityDescription, isOptional: Bool = false, minCount: Int = 1, maxCount: Int = 1, deleteRule: NSDeleteRule = .noActionDeleteRule, isOrdered: Bool = true) {
        self.init()
        self.name = name
        self.destinationEntity = destination
        self.isOptional = isOptional
        self.minCount = minCount
        self.maxCount = maxCount
        self.deleteRule = deleteRule
        self.isOrdered = isOrdered
    }
}
