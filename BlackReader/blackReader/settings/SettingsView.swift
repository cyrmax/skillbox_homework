import UIKit

class SettingsView: RootView {
    weak var delegate: SettingsViewController!
    var salg: UILayoutGuide {
        return self.safeAreaLayoutGuide
    }

    let voicesBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Выбрать предпочитаемый голос", comment: ""), for: .normal)
return btn
    }()

    let clearBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Очистить список книг", comment: ""), for: .normal)
return btn
    }()

    let vkBtn: BRListButton = {
let btn = BRListButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Группа приложения в VK", comment: ""), for: .normal)
return btn
    }()

    let madeByLbl: UILabel = {
let lbl = UILabel()
        LayoutEnhancer.prepare(lbl)
        lbl.text = NSLocalizedString("Создано Кириллом Белоусовым", comment: "")
        lbl.backgroundColor = .gray
return lbl
    }()

    let stack: UIStackView = {
        let st = UIStackView()
        LayoutEnhancer.prepare(st)
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
        return st
    }()

    private func setupView() {
        stack.addArrangedSubview(voicesBtn)
        stack.addArrangedSubview(clearBtn)
        stack.addArrangedSubview(vkBtn)
addSubview(stack)
addSubview(madeByLbl)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: salg.topAnchor, constant: 5),
            stack.leftAnchor.constraint(equalTo: salg.leftAnchor, constant: 5),
            stack.rightAnchor.constraint(equalTo: salg.rightAnchor, constant: -5),
            stack.bottomAnchor.constraint(equalTo: salg.bottomAnchor, constant: 100),
            madeByLbl.leftAnchor.constraint(equalTo: salg.leftAnchor, constant: 20),
            madeByLbl.rightAnchor.constraint(equalTo: salg.rightAnchor, constant: 50),
            madeByLbl.bottomAnchor.constraint(equalTo: salg.bottomAnchor),
            madeByLbl.heightAnchor.constraint(lessThanOrEqualToConstant: 30)
        ])

        voicesBtn.addTarget(delegate, action: #selector(delegate.voicesPressed), for: .touchUpInside)
        vkBtn.addTarget(delegate, action: #selector(delegate.vkPressed), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

}
