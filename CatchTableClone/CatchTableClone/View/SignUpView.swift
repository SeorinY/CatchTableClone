//
//  SignUpView.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/07.
//

import UIKit

protocol SignUpViewDelegate : AnyObject{
    func kakaoLoginButtonAction()
    func appleSignUpButtonAction()
    func orButtonAction()
    func naverSignUpButtonAction()
    func phoneNumSignUpButtonAction()
    func phoneNumLoginButtonAction()
    func inquireButtonAction()
}
class SignUpView: UIView {
    public weak var delegate : SignUpViewDelegate?
    
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
    
    private let alreadySignUpLabel : UILabel = {
        let label = UILabel()
        label.text = "이미 가입하셨나요?"
        label.font = UIFont.systemFont(ofSize:15)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    private let phoneNumLoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("전화번호로 로그인 하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:15)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let inquireButton : UIButton = {
        let button = UIButton()
        button.setTitle("회원 가입 문의", for: .normal)
        button.titleLabel?.attributedText = NSAttributedString(string: ".", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.titleLabel?.font = UIFont.systemFont(ofSize:15)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubView()
        configureButton()
    }
    
    private func configureSubView(){
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
        addSubview(alreadySignUpLabel)
        addSubview(phoneNumLoginButton)
        addSubview(inquireButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureButton(){
        kakaoSignUpBUtton.addTarget(self, action: #selector(didTapKakaoLoginButton), for: .touchUpInside)
        appleSignUpButton.addTarget(self, action: #selector(didTapAppleSignUpButton), for: .touchUpInside)
        orButton.addTarget(self, action: #selector(didTapOrButton), for: .touchUpInside)
        naverSignUpButton.addTarget(self, action: #selector(didTapNaverSignUpButton), for: .touchUpInside)
        phoneNumSignUpButton.addTarget(self, action: #selector(didTapPhoneNumSignUpButton), for: .touchUpInside)
        phoneNumLoginButton.addTarget(self, action: #selector(didTapPhoneNumLoginButton), for: .touchUpInside)
        inquireButton.addTarget(self, action: #selector(didTapInquireButton), for: .touchUpInside)
    }
    @objc private func didTapKakaoLoginButton(){
        delegate?.kakaoLoginButtonAction()
    }
    @objc private func didTapAppleSignUpButton(){
        delegate?.appleSignUpButtonAction()
    }
    @objc private func didTapOrButton(){
        delegate?.orButtonAction()
    }
    @objc private func didTapNaverSignUpButton(){
        delegate?.naverSignUpButtonAction()
    }
    @objc private func didTapPhoneNumSignUpButton(){
        delegate?.phoneNumSignUpButtonAction()
    }
    @objc private func didTapPhoneNumLoginButton(){
        delegate?.phoneNumLoginButtonAction()
    }
    @objc private func didTapInquireButton(){
        delegate?.inquireButtonAction()
    }

    override func layoutSubviews() {
        kakaoSignUpBUtton.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
            make.height.equalTo(50)
        })
        appleSignUpButton.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(kakaoSignUpBUtton.snp.bottom).offset(10)
            make.height.equalTo(50)
        })
        
        firstLine.snp.makeConstraints({make in
            make.centerY.equalTo(appleSignUpButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        })
        orStackView.snp.makeConstraints({make in
            make.centerY.equalTo(appleSignUpButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
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
        
        alreadySignUpLabel.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondLine.snp.bottom).offset(70)
            make.height.equalTo(20)
        })
        
        phoneNumLoginButton.snp.makeConstraints({make in
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().offset(-70)
            make.top.equalTo(alreadySignUpLabel.snp.bottom).offset(10)
            make.height.equalTo(50)
        })
        
        inquireButton.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneNumLoginButton.snp.bottom).offset(100)
            make.height.equalTo(15)
        })
    }

}
