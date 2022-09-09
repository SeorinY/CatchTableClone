//
//  PhoneNumberRegisterViewController.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit
import Then
import SnapKit

class PhoneNumberRegisterViewController: UIViewController {
    private let registerScrollView = UIScrollView().then{
        $0.backgroundColor = .systemBackground
    }
    private let contentView = UIView()
    private let nameLabel = UILabel().then {
        $0.text = "이름 *"
        $0.changeTextColor("*")
    }
    
    private let nameTextField = CSTextField().then{
        $0.placeholder = "  이름을 입력해 주세요."
    }
    private let nameWarningLabel = UILabel().then {
        $0.text = "레스토랑을 예약할 때 이름이므로 꼭 실명을 사용해 주세요."
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
    }
    
    private let phoneNumberLabel = UILabel().then {
        $0.text = "휴대폰 번호 *"
        $0.changeTextColor("*")
    }
    private let phoneNumberTextField = CSTextField().then{
        $0.placeholder = "  숫자만 입력해 주세요."
    }
    private let phoneNumberButton = UIButton().then{
        $0.setTitle("인증번호 요청", for: .normal)
        $0.setTitleColor(.systemGray, for: .normal)
        $0.backgroundColor = UIColor(red: 247.0 / 255.0, green: 247.0 / 255.0, blue: 247.0 / 255.0, alpha: 1)
        $0.layer.cornerRadius = 7
    }
    
    private let passWordLabel = UILabel().then {
        $0.text = "비밀 번호 *"
        $0.changeTextColor("*")
    }
    private let passwordTextField = CSTextField().then{
        $0.placeholder = "  비밀번호를 입력해 주세요."
    }
    private let passwordCheckTextField = CSTextField().then{
        $0.placeholder = "  비밀번호를 다시 한번 입력해 주세요."
    }
    private let passwordWarningLabel = UILabel().then {
        $0.text = "6자리 이상으로 설정해 주세요."
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)

    }
    private let nickNameLabel = UILabel().then {
        $0.text = "닉네임 (선택)"
    }
    private let nickNameTextField = CSTextField().then {
        $0.placeholder = "  닉네임을 입력해 주세요."
    }
    private let phone_linkLabel = UILabel().then {
        $0.text = "전화-링크 예약 앱에 연동하기 (선택)"
    }
    
    private let testLabel = CSTextField()
    
    private let phone_linkButton = CheckBoxButton("연동하기")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setLayout()
    }
    
}
private extension PhoneNumberRegisterViewController {
    func setUI() {
        self.view.addSubview(registerScrollView)
        self.registerScrollView.addSubview(contentView)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(nameWarningLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(phoneNumberButton)
        contentView.addSubview(phoneNumberTextField)
        contentView.addSubview(passWordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(passwordCheckTextField)
        contentView.addSubview(passwordWarningLabel)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(nickNameTextField)
        contentView.addSubview(phone_linkLabel)
        contentView.addSubview(phone_linkButton)

        contentView.addSubview(testLabel)
    }
    func setLayout() {
        self.registerScrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalTo(registerScrollView.snp.width)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(20)
        }
        self.nameTextField.setLayout(nameLabel.snp.bottom)

        self.nameWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        self.phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameWarningLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(15)
        }
        self.phoneNumberButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(122)
            make.height.equalTo(44)
        }
        self.phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalTo(phoneNumberButton.snp.leading).offset(-10)
            make.height.equalTo(44)
        }
        self.passWordLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(15)
        }
        self.passwordTextField.setLayout(passWordLabel.snp.bottom)

        self.passwordCheckTextField.setLayout(passwordTextField.snp.bottom)

        self.passwordWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        self.nickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordWarningLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(15)
        }
        self.nickNameTextField.setLayout(nickNameLabel.snp.bottom)

        self.phone_linkLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(nickNameTextField.snp.bottom).offset(40)
        }
        self.phone_linkButton.snp.makeConstraints { make in
            make.top.equalTo(phone_linkLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        self.testLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordWarningLabel.snp.bottom).offset(600)
            make.height.equalTo(44)
            make.leading.equalToSuperview()
            make.width.equalTo(40)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
