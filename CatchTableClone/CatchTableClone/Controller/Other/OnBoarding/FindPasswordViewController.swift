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
        $0.text = "케치테이블 가입 시 사용한 휴대폰 번호를 입력해주세요."
        $0.font = UIFont.systemFont(ofSize:15)
    }
    private let phoneNumTextField = CSTextField().then {
        $0.placeholder = "숫자만 입력해 주세요."
        $0.textColor = .secondaryLabel
        $0.backgroundColor = .secondarySystemBackground
        $0.font = UIFont.systemFont(ofSize:15)
    }
    private let certificationButton = UIButton().then {
        $0.setTitle("인증번호 요청", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize:15)
        $0.setTitleColor(.secondaryLabel, for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 7
    }
    
    private let changePasswordButton = UIButton().then {
        $0.setTitle("비밀번호 변경", for: .normal)
        $0.setTitleColor(.secondaryLabel, for: .normal)
        $0.backgroundColor = .secondarySystemBackground
        $0.layer.cornerRadius = 7
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(explainLabel)
        view.addSubview(phoneNumTextField)
        view.addSubview(certificationButton)
        view.addSubview(changePasswordButton)
        view.largeContentTitle = "비밀번호 찾기"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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





class FEQViewController: UIViewController {
    private let popupView = QuestionView(frame: .zero).then {
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        view.addSubview(popupView)
        popupView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        popupView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.height/6)
            make.bottom.equalToSuperview().offset(-view.height/6)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
extension FEQViewController : QuestionViewDelegate{
    func didTapOkButton() {
        dismiss(animated: false)
    }
}
