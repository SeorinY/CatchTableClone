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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginLogoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(200)
        }
        loginView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(loginLogoView.snp.bottom).offset(50)
        }

      
    }
}


//MARK: - Controller

extension LoginViewController2 {
//    @objc func kakaoLoginButtonPressed(_ sender : UIButton) {
//        print("kakao")
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoAccount() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//    }
//    @objc func appleLoginButtonPressed(_ sender : UIButton) {
//        print("apple")
//        //https://labs.brandi.co.kr/2021/04/09/chosh.html
//
//    }
//    @objc func naverLoginButtonPressed(_ sender : UIButton) {
//        
//    }
//    @objc func callLoginButtonPressed(_ sender : UIButton) {
//        print("call")
//
//    }
}
