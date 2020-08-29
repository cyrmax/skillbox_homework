struct SettingsCellStruct {
    let label: String
    let number: Int
    let needsSwitch: Bool

    init(label: String, needsSwitch: Bool = false, number: Int = 0) {
        self.label = label
        self.number = number
        self.needsSwitch = needsSwitch
    }
}
