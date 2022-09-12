//
//  PhoneNumberLoginViewController.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
import SnapKit
import Then

class PhoneNumberLoginViewController: UIViewController {
    private let logoView = LoginLogoView(frame: .zero)
    private let idTextField = UITextField().then {
        $0.placeholder = "휴대폰 번호 or 닉네임"
        $0.returnKeyType = .default
    }
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.returnKeyType = .default
    }
    
    private let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호를 잊어버리셨나요?", for: .normal)
        $0.titleLabel?.attributedText = NSAttributedString(string: ".", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        $0.titleLabel?.font = UIFont.systemFont(ofSize:15)
        $0.setTitleColor(.gray, for: .normal)
    }
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .secondarySystemBackground
        $0.setTitleColor(.secondaryLabel, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTextField()
        configureButton()
        view.addSubview(logoView)
    }
    private func configureTextField(){
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        idTextField.addTarget(self, action: #selector(chechLoginCondition), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(chechLoginCondition), for: .editingChanged)
        idTextField.becomeFirstResponder()
    }
    @objc private func chechLoginCondition(){
        if idTextField.text?.count ?? 0 < 1 || passwordTextField.text?.count ?? 0 < 6{
            loginButton.backgroundColor = .secondarySystemBackground
            loginButton.setTitleColor(.secondaryLabel, for: .normal)
        }else{
            loginButton.backgroundColor = .red
            loginButton.setTitleColor(.white, for: .normal)
        }
    }
    private func configureButton(){
        view.addSubview(findPasswordButton)
        view.addSubview(loginButton)
        findPasswordButton.addTarget(self, action: #selector(didTapFindPasswordButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    @objc private func didTapFindPasswordButton(){
        navigationController?.pushViewController(FindPasswordViewController(), animated: false)
    }
    @objc private func didTapLoginButton(){
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().dividedBy(2).offset(-50)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(30)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(30)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        findPasswordButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(30)
        }
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}


extension PhoneNumberLoginViewController : UITextFieldDelegate{
}
