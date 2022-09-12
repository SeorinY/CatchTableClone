//
//  CSTextField.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/08.
//

import UIKit
import SnapKit

class CSTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 247.0 / 255.0, green: 247.0 / 255.0, blue: 247.0 / 255.0, alpha: 1)
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(_ target: ConstraintRelatableTarget) {
        self.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
            make.top.equalTo(target).offset(10)
        }
    }
}

class CheckBoxButton : UIButton {
    let buttonText: String
    required init(_ text: String) {
        self.buttonText = text
        
        super.init(frame: .zero)
        self.layer.cornerRadius = 8
        self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        self.backgroundColor = .systemBackground
        self.tintColor = .systemGray
        self.setTitleColor(.black, for: .normal)
        self.setTitle("  \(text)", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.semanticContentAttribute = .forceLeftToRight
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .leading
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //    button.backgroundColor = UIColor(red: 253.0 / 255.0, green: 227.0 / 255.0, blue: 10.0 / 255.0, alpha: 1)
}

class generalButton : UIButton{
    enum buttonStyle{
        case ready
        case wait
    }
    var style : buttonStyle
    
    required init(_ buttonStyle : buttonStyle){
        style = buttonStyle
        super.init(frame: .zero)
        self.styleConfigure(buttonStyle)
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func styleConfigure(_ buttonStyle : buttonStyle){
        style = buttonStyle
        if buttonStyle == .ready{
            self.backgroundColor = UIColor(named: "logoColor")
            self.setTitleColor(.white, for: .normal)
        }
        else if buttonStyle == .wait{
            self.backgroundColor = UIColor(named: "buttonBackgroundColor")
            self.setTitleColor(.secondaryLabel, for: .normal)
        }
    }
}
