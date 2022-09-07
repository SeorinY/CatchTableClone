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

    private let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubview()
    }
    private func setSubview(){
        view.addSubview(loginHeaderView)
        view.addSubview(signUpView)
        signUpView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginHeaderView.snp.makeConstraints({make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        })
        signUpView.snp.makeConstraints({make in
            make.top.equalTo(loginHeaderView.snp.bottom).offset(30)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        })
    }    
}
extension LoginViewController1 : SignUpViewDelegate{
    func kakaoLoginButtonAction() {
        let alert = UIAlertController(title: "'캐치테이블'에서 '카카오톡'을(를) 열려고 합니다.", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "열기", style: .default) {_ in
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        })
        self.present(alert, animated: true)
    }
    func appleSignUpButtonAction() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
//        vc.view.frame = CGRect(x: 0, y: view.height/2, width: view.width, height: view.height/2)
        self.present(vc, animated: true)
    }
    func orButtonAction() {
        let vc = UIViewController()
//        vc.view.frame = CGRect(x: view.width/12, y: view.height/8, width: view.width*5/6, height: view.height*3/4)
        vc.view.backgroundColor = .systemBackground
        self.present(vc, animated: false)
    }

    func naverSignUpButtonAction() {
        let alert = UIAlertController(title: "'캐치테이블'에서 'NAVER'을(를) 열려고 합니다.", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "열기", style: .default) {_ in
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        })
        
        self.present(alert, animated: true)
    }
    func phoneNumSignUpButtonAction() {
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    func phoneNumLoginButtonAction() {
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    func inquireButtonAction() {
        let vc = UIViewController()
        vc.view.frame = view.bounds
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
