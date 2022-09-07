//
//  LoginLogoView_.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

class LoginLogoView_: UIView {
    private let subLogoLabel : UILabel = {
        let label = UILabel()
        label.text = "즐거운 미식생활의 시작"
        label.font = label.font.withSize(14)
        label.textColor = .systemGray2
        return label
    }()
    
    private let mainLogoLabel : UILabel = {
        let label = UILabel()
        label.text = "CATCH TABLE"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = UIColor(red: 252.0 / 255.0, green: 35.0 / 255.0, blue: 6.0 / 255.0, alpha: 1)
        
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(subLogoLabel)
        addSubview(mainLogoLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainLogoLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(0)
        }
        subLogoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainLogoLabel.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(0)
        }
    }
}
