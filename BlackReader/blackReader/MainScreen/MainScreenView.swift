import UIKit
class MainScreenView: RootView {
    weak var delegate: mainScreenViewController!
    var salg: UILayoutGuide {
        return self.safeAreaLayoutGuide
    }


    let lastBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Открыть последнюю книгу", comment: ""), for: .normal)
return btn
    }()

    let newBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Открыть новую книгу", comment: ""), for: .normal)
return btn
    }()

    let listBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Список книг", comment: ""), for: .normal)
return btn
    }()

    let settingsBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Настройки", comment: ""), for: .normal)
return btn
    }()

    let stack: UIStackView = {
let st = UIStackView()
        LayoutEnhancer.prepare(st)
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
return st
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
setupView()
    }
    func setupView() {
        stack.addArrangedSubview(lastBtn)
        stack.addArrangedSubview(newBtn)
        stack.addArrangedSubview(listBtn)
        stack.addArrangedSubview(settingsBtn)
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: salg.topAnchor, constant: 10),
            stack.leftAnchor.constraint(equalTo: salg.leftAnchor),
            stack.rightAnchor.constraint(equalTo: salg.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: salg.bottomAnchor)
        ])

        lastBtn.addTarget(delegate, action: #selector(delegate.lastBook), for: .touchUpInside)
        newBtn.addTarget(delegate, action: #selector(delegate.openNew), for: .touchUpInside)
        listBtn.addTarget(delegate, action: #selector(delegate.openBookList), for: .touchUpInside)
        settingsBtn.addTarget(delegate, action: #selector(delegate.openSettings), for: .touchUpInside)
    }
}
