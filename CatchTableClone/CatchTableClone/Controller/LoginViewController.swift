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


class LoginViewController: UIViewController {
    private let loginLogoView = LoginLogoView()
    private let loginView = LoginView()
    
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

extension LoginViewController : LoginVieWDelegate{
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
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        self.present(vc, animated: true)
    }
    
    func naverLoginButtonPressed() {
        let alert = UIAlertController(title: "'캐치테이블'에서 'NAVER'을(를) 열려고 합니다.", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "열기", style: .default) {_ in
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        })
        
        self.present(alert, animated: true)
    }
    
    func questionmarkButtonPressed() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        self.present(vc, animated: false)
    }
    
    func regsterButtonPressed() {
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func loginButtonPressed() {
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }

}
