import UIKit

class SettingsCell: UITableViewCell {
    private var guide: UILayoutGuide {
        contentView.safeAreaLayoutGuide
    }

    let icon: UIView = {
let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        return v
    }()

    let label: UILabel = {
let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .white
        return l
    }()

    let switcher: UISwitch = {
let s = UISwitch()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.backgroundColor = .gray
        return s
    }()

    let numberLbl: UILabel = {
let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .black
        l.layer.cornerRadius = l.frame.width
        l.layer.borderWidth = 1
        l.layer.borderColor = UIColor.red.cgColor
        return l
    }()

    let stack: UIStackView = {
let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        return s
    }()

    func setupView() {
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(switcher)
        stack.addArrangedSubview(numberLbl)
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: guide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            stack.leftAnchor.constraint(equalTo: guide.leftAnchor),
            stack.rightAnchor.constraint(equalTo: guide.rightAnchor),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            switcher.widthAnchor.constraint(equalTo: switcher.heightAnchor),
            numberLbl.widthAnchor.constraint(equalTo: numberLbl.heightAnchor)
        ])
        switcher.isHidden = true
        numberLbl.isHidden = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
setupView()
    }
}
