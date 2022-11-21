//
//  RegisterView.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
class RegisterCell: UITableViewCell {
    private let checkBoxButton = CheckBoxButton("")
    var checkBoxState: CheckBoxButton.buttonStyle {
        get {
            return checkBoxButton.style
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
        addSubview(checkBoxButton)        
        checkBoxButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(_ text: String) {
        checkBoxButton.setTitle(text, for: .normal)
    }
    public func pressedButton() {
        checkBoxButton.didClickButton()
    }
    public func buttonCheck(_ buttonStyle: CheckBoxButton.buttonStyle) {
        checkBoxButton.styleConfigure(buttonStyle)
    }

}
