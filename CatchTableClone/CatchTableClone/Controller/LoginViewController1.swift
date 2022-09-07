//
//  ViewController.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/05.
//

import UIKit
import SnapKit

class LoginViewController1: UIViewController {
    private let loginHeaderView = LoginHeaderView()

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
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubview()
        setLayout()
        setButton()
    }
    private func setSubview(){
        view.addSubview(loginHeaderView)
        view.addSubview(alreadySignUpLabel)
        view.addSubview(phoneNumLoginButton)
        view.addSubview(inquireButton)
    }
    
    private func setLayout(){
        loginHeaderView.snp.makeConstraints({make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        })
        
        
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
//            make.top.equalTo(phoneNumLoginButton.snp.bottom).offset(100)
            make.bottom.equalTo(additionalSafeAreaInsets.bottom).offset(0)
            make.height.equalTo(15)
        })
    }
    private func setButton(){
        kakaoSignUpBUtton.addTarget(self, action: #selector(didTapKakaoLoginButton), for: .touchUpInside)
        appleSignUpButton.addTarget(self, action: #selector(didTapAppleSignUpButton), for: .touchUpInside)
        orButton.addTarget(self, action: #selector(didTapOrButton), for: .touchUpInside)
        naverSignUpButton.addTarget(self, action: #selector(didTapNaverSignUpButton), for: .touchUpInside)
        phoneNumSignUpButton.addTarget(self, action: #selector(didTapPhoneNumSignUpButton), for: .touchUpInside)
        phoneNumLoginButton.addTarget(self, action: #selector(didTapPhoneNumLoginButton), for: .touchUpInside)
        inquireButton.addTarget(self, action: #selector(didTapInquireButton), for: .touchUpInside)
    }
    @objc private func didTapKakaoLoginButton(){
        DEBUG_LOG(1)
        let alert = UIAlertController(title: "'캐치테이블'에서 '카카오톡'을(를) 열려고 합니다.", message: "", preferredStyle: .alert)
        DEBUG_LOG(2)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        DEBUG_LOG(3)
        alert.addAction(UIAlertAction(title: "열기", style: .default) {_ in
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        })
        DEBUG_LOG(4)
        self.present(alert, animated: true)
        DEBUG_LOG(5)
    }
    @objc private func didTapAppleSignUpButton(){
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
//        vc.view.frame = CGRect(x: 0, y: view.height/2, width: view.width, height: view.height/2)
        self.present(vc, animated: true)
    }
    @objc private func didTapOrButton(){
        let vc = UIViewController()
//        vc.view.frame = CGRect(x: view.width/12, y: view.height/8, width: view.width*5/6, height: view.height*3/4)
        vc.view.backgroundColor = .systemBackground
        self.present(vc, animated: false)
    }
    @objc private func didTapNaverSignUpButton(){
        let alert = UIAlertController(title: "'캐치테이블'에서 'NAVER'을(를) 열려고 합니다.", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "열기", style: .default) {_ in
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        })
        
        self.present(alert, animated: true)
    }
    @objc private func didTapPhoneNumSignUpButton(){
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc private func didTapPhoneNumLoginButton(){
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc private func didTapInquireButton(){
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
