import UIKit

class ReadBookView: RootView {
    weak var delegate: ReadBookViewController!
    var salg: UILayoutGuide {
        return safeAreaLayoutGuide
    }

    let pauseBtn: BRButton = {
let btn = BRButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Пуск", comment: ""), for: .normal)
        btn.setTitle(NSLocalizedString("Пауза", comment: ""), for: .selected)
return btn
    }()

    let backBtn: BRButton = {
let btn = BRButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Назад", comment: ""), for: .normal)
return btn
    }()

    let forwardBtn: BRButton = {
        let btn = BRButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("Вперёд", comment: ""), for: .normal)
return btn
    }()

    let playerStack: UIStackView = {
let stack = UIStackView()
        LayoutEnhancer.prepare(stack)
        stack.accessibilityLabel = NSLocalizedString("Плеер", comment: "")
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
return stack
    }()

    let startBtn: BRButton = {
let btn = BRButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("В начало книги", comment: ""), for: .normal)
        return btn
    }()

    let endBtn: BRButton = {
let btn = BRButton()
        LayoutEnhancer.prepare(btn)
        btn.setTitle(NSLocalizedString("В конец книги", comment: ""), for: .normal)
        return btn
    }()

    let moveSlider: SliderView = {
let slider = SliderView()
        LayoutEnhancer.prepare(slider)
        slider.accessibilityLabel = NSLocalizedString("Перемещение по страницам", comment: "")
        return slider
    }()

    let navigationStack: UIStackView = {
let stack = UIStackView()
        LayoutEnhancer.prepare(stack)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()

    let pitchSlider: SliderView = {
let slider = SliderView()
        LayoutEnhancer.prepare(slider)
        slider.accessibilityLabel = NSLocalizedString("Настройка высоты", comment: "")
return slider
    }()

    let volumeSlider: SliderView = {
        let slider = SliderView()
        LayoutEnhancer.prepare(slider)
        slider.accessibilityLabel = NSLocalizedString("Настройка громкости", comment: "")
        return slider
    }()

    let rateSlider: SliderView = {
        let slider = SliderView()
        LayoutEnhancer.prepare(slider)
        slider.accessibilityLabel = NSLocalizedString("Настройка скорости", comment: "")
        return slider
    }()

    let controlStack: UIStackView = {
let stack = UIStackView()
        LayoutEnhancer.prepare(stack)
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 5
return stack
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
        playerStack.addArrangedSubview(backBtn)
        playerStack.addArrangedSubview(pauseBtn)
        playerStack.addArrangedSubview(forwardBtn)
        addSubview(playerStack)
        navigationStack.addArrangedSubview(startBtn)
        navigationStack.addArrangedSubview(moveSlider)
        navigationStack.addArrangedSubview(endBtn)
        addSubview(navigationStack)
        controlStack.addArrangedSubview(rateSlider)
        controlStack.addArrangedSubview(pitchSlider)
        controlStack.addArrangedSubview(volumeSlider)
        addSubview(controlStack)
        NSLayoutConstraint.activate([
            playerStack.leftAnchor.constraint(equalTo: salg.leftAnchor),
            playerStack.rightAnchor.constraint(equalTo: salg.rightAnchor),
            playerStack.bottomAnchor.constraint(equalTo: salg.bottomAnchor),
            playerStack.heightAnchor.constraint(equalToConstant: 100),
            controlStack.leftAnchor.constraint(equalTo: salg.leftAnchor),
            controlStack.rightAnchor.constraint(equalTo: salg.rightAnchor),
            controlStack.bottomAnchor.constraint(equalTo: playerStack.topAnchor, constant: -10),
            controlStack.heightAnchor.constraint(equalToConstant: 170),
            navigationStack.leftAnchor.constraint(equalTo: salg.leftAnchor),
            navigationStack.rightAnchor.constraint(equalTo: salg.rightAnchor),
            navigationStack.bottomAnchor.constraint(equalTo: controlStack.topAnchor, constant: -15),
            controlStack.heightAnchor.constraint(equalToConstant: 70),
        ])

        backBtn.addTarget(delegate, action: #selector(delegate.back), for: .touchUpInside)
        pauseBtn.addTarget(delegate, action: #selector(delegate.play), for: .touchUpInside)
        forwardBtn.addTarget(delegate, action: #selector(delegate.forward), for: .touchUpInside)
        startBtn.addTarget(delegate, action: #selector(delegate.goToStart), for: .touchUpInside)
        endBtn.addTarget(delegate, action: #selector(delegate.goToEnd), for: .touchUpInside)
    }
}
