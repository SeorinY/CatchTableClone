//
//  FindPasswordViewController.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
import SnapKit
import Then



class FindPasswordViewController: UIViewController {
    private let explainLabel = UILabel().then {
        $0.text = "캐치테이블 가입 시 사용한 휴대폰 번호를 입력해주세요."
        $0.font = Font.generalFont
    }
    private let phoneNumTextField = CSTextField("숫자만 입력해 주세요.")
    private let certificationButton = generalButton(.wait, "인증번호 요청")
    private let changePasswordButton = generalButton(.wait, "비밀번호 변경")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationLabel("비밀번호 변경")
        addSubView()
        setSubViewLayout()
    }
    private func addSubView(){
        view.addSubview(explainLabel)
        view.addSubview(phoneNumTextField)
        phoneNumTextField.addTarget(self, action: #selector(checkPhoneNum), for: .editingChanged)
        view.addSubview(certificationButton)
        view.addSubview(changePasswordButton)
    }
    @objc private func checkPhoneNum(){
        if phoneNumTextField.text?.count ?? 0 < 10 { certificationButton.styleConfigure(.wait) }
        else { certificationButton.styleConfigure(.ready) }
    }
    private func setSubViewLayout() {
        explainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        phoneNumTextField.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(view.width*6/10)
            make.height.equalTo(50)
        }
        certificationButton.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(10)
            make.leading.equalTo(phoneNumTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        changePasswordButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
}
