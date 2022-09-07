//
//  LoginViewController2.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/05.
//

import UIKit
import SnapKit
import KakaoSDKCommon
import KakaoSDKUser


class LoginViewController2: UIViewController {
    
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
    
    private let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    private let kakaoLoginButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(kakaoLoginButtonPressed(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.backgroundColor = UIColor(red: 253.0 / 255.0, green: 227.0 / 255.0, blue: 10.0 / 255.0, alpha: 1)

        button.tintColor = .black
        button.setTitle("  카카오로 시작하기", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private let appleLoginButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(appleLoginButtonPressed(_:)), for: .touchUpInside)

        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "applelogo")?.imageResize(sizeChange: CGSize(width: 20, height: 20)), for: .normal)

        button.tintColor = .label
        button.setTitle("  Apple로 시작하기", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let lineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let lineView3 : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let callButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(callLoginButtonPressed(_:)), for: .touchUpInside)

        button.layer.cornerRadius = 22
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.setImage(UIImage(systemName: "phone.fill")?.imageResize(sizeChange: CGSize(width: 20, height: 20)), for: .normal)

        return button
    }()
    
    private let naverButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(naverLoginButtonPressed(_:)), for: .touchUpInside)

//        let uiImage = UIImage(named: "naver")
        button.setImage(UIImage(named: "naver")?.imageResize(sizeChange: CGSize(width: 27, height: 27)), for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        return button
    }()
    
    private let RegisterLabel : UILabel = {
       let label = UILabel()
        label.text = "이미 가입하셨나요?"
        label.font = label.font.withSize(15)
        return label
    }()
    
    private let phoneLoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("전화번호로 로그인 하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20

        return button
    }()
    
//    private let inquireRegister : UILabel = {
//        let label = UILabel()
//        label.
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCenterView()
        
        view.addSubview(mainLogoLabel)
        view.addSubview(subLogoLabel)
        view.addSubview(centerStackView)
        view.addSubview(appleLoginButton)
        view.addSubview(kakaoLoginButton)
        view.addSubview(lineView1)
        view.addSubview(lineView2)
        view.addSubview(lineView3)
        
        view.addSubview(naverButton)
        view.addSubview(callButton)
        view.addSubview(RegisterLabel)
        view.addSubview(phoneLoginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainLogoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(kakaoLoginButton.snp.top).offset(-80)
            make.leading.equalToSuperview().offset(15)
        }
        subLogoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainLogoLabel.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(15)
        }
        
        centerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        appleLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(centerStackView.snp.top).offset(-25)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
        kakaoLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(appleLoginButton.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
        
        lineView1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalTo(centerStackView.snp.leading).offset(-10)
            make.height.equalTo(1)
            make.centerY.equalTo(centerStackView.snp.centerY)
        }
        
        lineView2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.leading.equalTo(centerStackView.snp.trailing).offset(10)
            make.height.equalTo(1)
            make.centerY.equalTo(centerStackView.snp.centerY)
        }
        
        lineView3.snp.makeConstraints { make in
            make.top.equalTo(centerStackView.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(1)
        }
        
        
        naverButton.snp.makeConstraints { make in
            make.trailing.equalTo(lineView3.snp.centerX).offset(-35)
            make.centerY.equalTo(lineView3.snp.centerY)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        callButton.snp.makeConstraints { make in
            make.leading.equalTo(lineView3.snp.centerX).offset(50)
            make.centerY.equalTo(lineView3.snp.centerY)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        RegisterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(naverButton.snp.bottom).offset(35)
        }
        phoneLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(RegisterLabel.snp.bottom).offset(17)
            make.width.equalTo(250)
            make.height.equalTo(44)
        }
    }
}

//MARK: - SetView

extension LoginViewController2 {
    func setCenterView() {
        let label = UILabel()
        label.text = "또는"
        label.textColor = .systemGray
        let button = UIButton()
        let buttonImage = UIImage(systemName: "questionmark.circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        [label, button].map {
            self.centerStackView.addArrangedSubview($0)
        }
    }
}

//MARK: - Controller

extension LoginViewController2 {
    @objc func kakaoLoginButtonPressed(_ sender : UIButton) {
        print("kakao")
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    @objc func appleLoginButtonPressed(_ sender : UIButton) {
        print("apple")
        //https://labs.brandi.co.kr/2021/04/09/chosh.html

    }
    @objc func naverLoginButtonPressed(_ sender : UIButton) {
        
    }
    @objc func callLoginButtonPressed(_ sender : UIButton) {
        print("call")

    }
}
