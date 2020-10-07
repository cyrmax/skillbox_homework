import Foundation
extension String {
    func splitToSentences() -> [String] {
        var sentences: [String] = [""]
        var pointer = 0
        for symbol in self {
            sentences[pointer].append(symbol)
            if symbol == "." || symbol == "?" || symbol == "!" || symbol == "\r" || symbol == "\n" {
                pointer += 1
                sentences.append("")
            }
        }
        return sentences
}
}
