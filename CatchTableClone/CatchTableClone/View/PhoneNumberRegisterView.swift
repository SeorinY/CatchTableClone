//
//  RegisterView.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

protocol RegisterCellDelegate  {
    func cellPressed()
}

class PhoneNumberRegisterCell: UITableViewCell {
    private let checkBoxButton = CheckBoxButton("").then{
        $0.addTarget(self, action: #selector(didTapCell), for: .touchUpInside)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
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
    
    @objc func didTapCell() {
        
    }
}
