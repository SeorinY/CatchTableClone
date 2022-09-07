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
    private let loginLogoView = LoginLogoView_()
    private let loginView = LoginView_()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginLogoView)
        view.addSubview(loginView)
        loginView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginLogoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview()
            make.height.equalTo(200)
            make.trailing.equalToSuperview()
        }
        loginView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(loginLogoView.snp.bottom).offset(50)
            make.bottom.equalToSuperview()
        }
        

      
    }
}


//MARK: - Controller

extension LoginViewController2 : LoginVieWDelegate{
    func kakaoLoginButtonPressed() {
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
    func appleLoginButtonPressed() {
        print("apple")
    }
    
    func naverLoginButtonPressed() {
        print("naver")
    }
    
    func questionmarkButtonPressed() {
        print("naver")
    }
    
    func regsterButtonPressed() {
        print("naver")
    }
    
    func loginButtonPressed() {
        print("naver")
    }

}
