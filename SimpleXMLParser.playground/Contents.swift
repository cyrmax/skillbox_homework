import Foundation

class Node {
    let name: String
    private(set) var children = [Node]()
    weak var parent: Node?
    var attributes: [String: String] = [:]
    var stringValue: String?

    init(name: String) {
        self.name = name
    }

    func addChild(node: Node) {
        children.append(node)
        node.parent = self
    }

    var description: String {
var result = ""
result += "<\(name)>"
        result += stringValue ?? ""
        for child in children {
            result += child.description
        }
result += "</\(name)>"
return result
    }
}

class SimpleXMLParser: NSObject, XMLParserDelegate {
    private let parser: XMLParser
    private var currentNode: Node?
    private var rootNode: Node?

    init(data: Data) {
        self.parser = XMLParser(data: data)
        super.init()
        parser.delegate = self
    }

    func parse() -> Node? {
        if parser.parse() {
return rootNode
        }
return nil
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
let node = Node(name: elementName)
        node.attributes = attributeDict
        currentNode?.addChild(node: node)
currentNode = node
        if rootNode == nil {
rootNode = currentNode
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentNode = currentNode?.parent
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        guard currentNode != nil else {
            return
        }
        if currentNode?.stringValue == nil {
            currentNode?.stringValue = string
        }
        else {
            currentNode?.stringValue! += string
        }
    }
}


let xmlstr = """
<person>
<name>Kirill</name>
<lastname>Belousov</lastname>
</person>
"""
let xmldata = xmlstr.data(using: .utf8)!


let parser = SimpleXMLParser(data: xmldata)
let xmldecoded = parser.parse()
print(xmldecoded?.description)
