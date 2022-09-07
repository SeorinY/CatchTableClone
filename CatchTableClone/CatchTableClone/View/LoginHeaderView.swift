//
//  LoginHeaderView.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/07.
//

import UIKit

class LoginHeaderView: UIView {
    private let subLogoLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "즐거운 미식생활의 시작"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    private let logoLabel : UILabel = {
        let label = UILabel()
//        label.textColor = .init(red: 1, green: 0.2, blue: 0, alpha: 1)
        label.textColor = .init(cgColor: CGColor(red: 252/255, green: 35/255, blue: 6/255, alpha: 1))
        label.text = "CATCH TABLE"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subLogoLabel)
        addSubview(logoLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        subLogoLabel.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.height.equalTo(20)
        })
        logoLabel.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(subLogoLabel.snp.bottom)
            make.height.equalTo(40)
        })
    }
}
