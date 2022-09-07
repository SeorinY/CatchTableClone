//
//  SignUpView.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/07.
//

import UIKit

class SignUpView: UIView {
    
    private let kakaoSignUpBUtton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemYellow
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.setTitle(" 카카오로 시작하기", for: .normal)
        button.tintColor = .black
        button.setTitleColor( .black, for: .normal)
        return button
    }()
    private let appleSignUpButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "applelogo", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.setTitle(" Apple로 시작하기", for: .normal)
        button.tintColor = .black
        button.setTitleColor( .black, for: .normal)
        return button
    }()
    
    private let orLogoLabel : UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.font = UIFont.systemFont(ofSize:15)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    private let orButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    private let firstLine : UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    private let orStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.backgroundColor = .white
        view.spacing = 3
        return view
    }()
    private let naverSignUpButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        let image = UIImage(named: "naver")
        button.setImage(image, for: .normal)
        return button
    }()
    private let phoneNumSignUpButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "phone.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    private let secondLine : UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(kakaoSignUpBUtton)
        addSubview(appleSignUpButton)
        
        addSubview(firstLine)
        addSubview(orStackView)
        [orLogoLabel, orButton].map{
            orStackView.addArrangedSubview($0)
        }
        addSubview(naverSignUpButton)
        addSubview(phoneNumSignUpButton)
        addSubview(secondLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        firstLine.snp.makeConstraints({make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        })
        orStackView.snp.makeConstraints({make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
        })
        appleSignUpButton.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(orStackView.snp.top).offset(-40)
            make.height.equalTo(50)
        })

        kakaoSignUpBUtton.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(appleSignUpButton.snp.top).offset(-10)
            make.height.equalTo(50)
        })
        
        naverSignUpButton.snp.makeConstraints({make in
            make.centerX.equalToSuperview().offset(-60)
            make.top.equalTo(firstLine.snp.bottom).offset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        phoneNumSignUpButton.snp.makeConstraints({make in
            make.centerX.equalToSuperview().offset(60)
            make.top.equalTo(firstLine.snp.bottom).offset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        })
        
        secondLine.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.width.equalTo(1)
            make.top.equalTo(firstLine.snp.bottom).offset(70)
            make.height.equalTo(20)
        })
    }
}
