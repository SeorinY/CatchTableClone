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
import NaverThirdPartyLogin
import Alamofire


class LoginViewController: UIViewController{
    private let loginLogoView = LoginLogoView()
    private let loginView = LoginView()
    
    
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginLogoView)
        view.addSubview(loginView)
        self.setLayout()
        loginView.delegate = self
        naverLoginInstance?.delegate = self
    }
    
    func setLayout() {
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
    }
    
    func naverLoginButtonPressed() {
        self.naverLoginInstance?.requestThirdPartyLogin()
//        naverLoginInstance?.requestDeleteToken()    // 로그아웃
    }
    
    func questionmarkButtonPressed() {
        let vc = FEQViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    func regsterButtonPressed() {
        navigationBackBtnLayout()
        let vc = PhoneNumberRegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func loginButtonPressed() {
        navigationBackBtnLayout()
        let vc = PhoneNumberLoginViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    func inquireButtonPressed() {
        navigationBackBtnLayout()
        let vc = InquireViewController()
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
// MARK: - Naver Login
extension LoginViewController : NaverThirdPartyLoginConnectionDelegate{
    func naverLoginPaser() {
              guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
              
              if !accessToken {
                return
              }
              
              guard let tokenType = naverLoginInstance?.tokenType else { return }
              guard let accessToken = naverLoginInstance?.accessToken else { return }
                
              let requestUrl = "https://openapi.naver.com/v1/nid/me"
              let url = URL(string: requestUrl)!
              
              let authorization = "\(tokenType) \(accessToken)"
              
              let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
              
              req.responseJSON { response in
                
                guard let body = response.value as? [String: Any] else { return }
                  
                  if let resultCode = body["message"] as? String{
                      if resultCode.trimmingCharacters(in: .whitespaces) == "success"{
                          let resultJson = body["response"] as! [String: Any]
                          
                          let name = resultJson["name"] as? String ?? ""
                          let id = resultJson["id"] as? String ?? ""
                          let phone = resultJson["mobile"] as! String
                          let gender = resultJson["gender"] as? String ?? ""
                          let birthyear = resultJson["birthyear"] as? String ?? ""
                          let birthday = resultJson["birthday"] as? String ?? ""
                          let profile = resultJson["profile_image"] as? String ?? ""
                          let email = resultJson["email"] as? String ?? ""
                          let nickName = resultJson["nickname"] as? String ?? ""
                      }
                      else{
                          //실패
                      }
                  }
              }
        }
 
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("네이버 로그인 성공")
        self.naverLoginPaser()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("네이버 토큰\(naverLoginInstance?.accessToken)")
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        print("네이버 로그아웃")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
    }
}
