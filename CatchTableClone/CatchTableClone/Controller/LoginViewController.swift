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
import AuthenticationServices


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
            make.height.equalTo(view.height/4)
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
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
//        let vc = UIViewController()
//        vc.view.backgroundColor = .systemBackground
//        self.present(vc, animated: true)
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


//MARK: - apple login
extension LoginViewController : ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
                
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
     
        default:
            break
        }
    }
        
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
    
}
