//
//  LoginView_.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
import Then

protocol LoginVieWDelegate : AnyObject {
    func kakaoLoginButtonPressed()
    func appleLoginButtonPressed()
    func naverLoginButtonPressed()
    func questionmarkButtonPressed()
    func regsterButtonPressed()
    func loginButtonPressed()
    func inquireButtonPressed()
}

class LoginView: UIView {
    public weak var delegate: LoginVieWDelegate?
    private let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let orLabel : UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textColor = .systemGray
        return label
    }()
    
    private let questionmarkButton : UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(systemName: "questionmark.circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let kakaoLoginButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.backgroundColor = UIColor(red: 253.0 / 255.0, green: 227.0 / 255.0, blue: 10.0 / 255.0, alpha: 1)

        button.tintColor = .black
        button.setTitle("  카카오로 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private let appleLoginButton : UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "applelogo")?.imageResize(sizeChange: CGSize(width: 20, height: 20)), for: .normal)
        
        button.tintColor = .black
        button.setTitle("  Apple로 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let horizontalLineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    
    private let verticalLineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 22
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.setImage(UIImage(systemName: "phone.fill")?.imageResize(sizeChange: CGSize(width: 20, height: 20)), for: .normal)
        
        return button
    }()
    
    private let naverLoginButton : UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "naver")?.imageResize(sizeChange: CGSize(width: 27, height: 27)), for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        return button
    }()
    
    private let loginLabel : UILabel = {
        let label = UILabel()
        label.text = "이미 가입하셨나요?"
        label.font = label.font.withSize(15)
        return label
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("전화번호로 로그인 하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private let inquireButton = UIButton().then {
        $0.setTitle("회원 가입 문의", for: .normal)
        $0.titleLabel?.attributedText = NSAttributedString(string: ".", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        $0.titleLabel?.font = UIFont.systemFont(ofSize:15)
        $0.setTitleColor(.gray, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(verticalLineView)
        addSubview(horizontalLineView)
        
        addSubview(centerStackView)
        [orLabel, questionmarkButton].forEach { view in
            self.centerStackView.addArrangedSubview(view)
        }
        
        
        addSubview(buttonStackView)
        [kakaoLoginButton, appleLoginButton].forEach { view in
            self.buttonStackView.addArrangedSubview(view)
        }
        
        addSubview(naverLoginButton)
        addSubview(registerButton)
        addSubview(loginLabel)
        addSubview(loginButton)
        addSubview(inquireButton)
        setButtonTarget()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func setLayout() {
        buttonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(100)
        }
        centerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonStackView.snp.bottom).offset(35)
            make.width.equalTo(70)
        }
        
        
        horizontalLineView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.centerY.equalTo(centerStackView.snp.centerY)
        }
        
        
        verticalLineView.snp.makeConstraints { make in
            make.top.equalTo(centerStackView.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(1)
        }
        
        naverLoginButton.snp.makeConstraints { make in
            make.trailing.equalTo(verticalLineView.snp.centerX).offset(-35)
            make.centerY.equalTo(verticalLineView.snp.centerY)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        registerButton.snp.makeConstraints { make in
            make.leading.equalTo(verticalLineView.snp.centerX).offset(35)
            make.centerY.equalTo(verticalLineView.snp.centerY)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(naverLoginButton.snp.bottom).offset(35)
        }
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(17)
            make.width.equalTo(250)
            make.height.equalTo(44)
        }
        inquireButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(100)
            make.height.equalTo(15)
        }
    }
    
    func setButtonTarget() {
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
        naverLoginButton.addTarget(self, action: #selector(naverLoginButtonTapped), for: .touchUpInside)
        questionmarkButton.addTarget(self, action: #selector(questionmarkButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        inquireButton.addTarget(self, action: #selector(inquireButtonTapped), for: .touchUpInside)
    }
    
    @objc func kakaoLoginButtonTapped() {
        delegate?.kakaoLoginButtonPressed()
    }
    @objc func appleLoginButtonTapped() {
        delegate?.appleLoginButtonPressed()
    }
    @objc func naverLoginButtonTapped() {
        delegate?.naverLoginButtonPressed()
    }
    @objc func questionmarkButtonTapped() {
        delegate?.questionmarkButtonPressed()
    }
    @objc func registerButtonTapped() {
        delegate?.regsterButtonPressed()
    }
    @objc func loginButtonTapped() {
        delegate?.loginButtonPressed()
    }
    @objc func inquireButtonTapped(){
        delegate?.inquireButtonPressed()
    }
}
