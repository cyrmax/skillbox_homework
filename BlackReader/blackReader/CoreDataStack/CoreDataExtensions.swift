import CoreData


extension Book {

    @objc(insertObject:inSentencesAtIndex:)
    @NSManaged public func insertIntoSentences(_ value: Sentence, at idx: Int)

    @objc(removeObjectFromSentencesAtIndex:)
    @NSManaged public func removeFromSentences(at idx: Int)

    @objc(insertSentences:atIndexes:)
    @NSManaged public func insertIntoSentences(_ values: [Sentence], at indexes: NSIndexSet)

    @objc(removeSentencesAtIndexes:)
    @NSManaged public func removeFromSentences(at indexes: NSIndexSet)

    @objc(replaceObjectInSentencesAtIndex:withObject:)
    @NSManaged public func replaceSentences(at idx: Int, with value: Sentence)

    @objc(replaceSentencesAtIndexes:withSentences:)
    @NSManaged public func replaceSentences(at indexes: NSIndexSet, with values: [Sentence])

    @objc(addSentencesObject:)
    @NSManaged public func addToSentences(_ value: Sentence)

    @objc(removeSentencesObject:)
    @NSManaged public func removeFromSentences(_ value: Sentence)

    @objc(addSentences:)
    @NSManaged public func addToSentences(_ values: NSOrderedSet)

    @objc(removeSentences:)
    @NSManaged public func removeFromSentences(_ values: NSOrderedSet)

}

