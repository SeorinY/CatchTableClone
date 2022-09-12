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
    private let checkBoxItem = [
        "  [필수] 캐치테이블 이용약간 동의",
        "  [필수] 개인정보 수집 및 이용 약관 동의",
        "  [필수] 개인정보 제3자 제공 동의",
        "  [선택] 개인정도 제공 동의",
        "  [선택] 이벤트 알림 서비스 동의"
    ]
    
    private let registerScrollView = UIScrollView().then{
        $0.backgroundColor = .systemBackground
    }
    private let contentView = UIView()
    private let nameLabel = UILabel().then {
        $0.text = "이름 *"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.changeTextColor("*")
    }
    
    private let nameTextField = CSTextField().then{
        $0.placeholder = "  이름을 입력해 주세요."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let nameWarningLabel = UILabel().then {
        $0.text = "레스토랑을 예약할 때 이름이므로 꼭 실명을 사용해 주세요."
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    private let phoneNumberLabel = UILabel().then {
        $0.text = "휴대폰 번호 *"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.changeTextColor("*")
    }
    private let questionmarkButton = UIButton().then{
        let buttonImage = UIImage(systemName: "questionmark.circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        $0.setImage(buttonImage, for: .normal)
    }
    private let phoneNumberTextField = CSTextField().then{
        $0.placeholder = "  숫자만 입력해 주세요."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let phoneNumberButton = UIButton().then{
        $0.setTitle("인증번호 요청", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(.systemGray, for: .normal)
        $0.backgroundColor = UIColor(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0, alpha: 1)
        $0.layer.cornerRadius = 7
    }
    
    private let passWordLabel = UILabel().then {
        $0.text = "비밀 번호 *"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.changeTextColor("*")
    }
    private let passwordTextField = CSTextField().then{
        $0.placeholder = "  비밀번호를 입력해 주세요."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let passwordCheckTextField = CSTextField().then{
        $0.placeholder = "  비밀번호를 다시 한번 입력해 주세요."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let passwordWarningLabel = UILabel().then {
        $0.text = "6자리 이상으로 설정해 주세요."
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)

    }
    private let nickNameLabel = UILabel().then {
        $0.text = "닉네임 (선택)"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let nickNameTextField = CSTextField().then {
        $0.placeholder = "  닉네임을 입력해 주세요."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    private let phone_linkLabel = UILabel().then {
        $0.text = "전화-링크 예약 앱에 연동하기 (선택)"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private let seletAllButton = CheckBoxButton("이용자 약관 전체 동의").then{
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
    }
    private let phone_linkButton = CheckBoxButton("연동하기")

    private let horizontalLine = UIView().then{
        $0.backgroundColor = UIColor(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0, alpha: 1)
    }
    private let checkBoxTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(PhoneNumberRegisterCell.self, forCellReuseIdentifier: "checkBoxCell")
        $0.allowsSelection = false
    }
    
    private let pushAlarmCheckBoxButton = CheckBoxButton(" 푸시 알림")
    private let SMSCheckBoxButton = CheckBoxButton(" SMS수신")
    private let emailCheckBoxButton = CheckBoxButton(" 이메일 수신")
    
    private let checkBoxStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 1
    }
    
    private let startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = UIColor(red: 252.0 / 255.0, green: 36.0 / 255.0, blue: 6.0 / 255.0, alpha: 1)
        $0.layer.cornerRadius = 8
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxTableView.delegate = self
        checkBoxTableView.dataSource = self
        navigationLabel("회원가입")
        self.setUI()
        self.setLayout()
    }
    
}

extension PhoneNumberRegisterViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkBoxItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checkBoxTableView.dequeueReusableCell(withIdentifier: "checkBoxCell", for: indexPath) as! PhoneNumberRegisterCell
        cell.accessoryType = .disclosureIndicator
        cell.configure(checkBoxItem[indexPath.row])
        return cell
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
        contentView.addSubview(questionmarkButton)
        contentView.addSubview(phoneNumberTextField)
        contentView.addSubview(passWordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(passwordCheckTextField)
        contentView.addSubview(passwordWarningLabel)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(nickNameTextField)
        contentView.addSubview(phone_linkLabel)
        contentView.addSubview(phone_linkButton)
        contentView.addSubview(seletAllButton)
        contentView.addSubview(horizontalLine)
        contentView.addSubview(checkBoxTableView)
        
        [pushAlarmCheckBoxButton, SMSCheckBoxButton, emailCheckBoxButton].map {checkBoxStackView.addArrangedSubview($0)}
        contentView.addSubview(checkBoxStackView)
        contentView.addSubview(startButton)
//        contentView.addSubview(testLabel)
    }
    func setLayout() {
        self.registerScrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalToSuperview()
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
        self.questionmarkButton.snp.makeConstraints { make in
            make.centerY.equalTo(phoneNumberLabel)
            make.leading.equalTo(phoneNumberLabel.snp.trailing).offset(7)
            make.height.width.equalTo(15)
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

        self.seletAllButton.snp.makeConstraints { make in
            make.top.equalTo(phone_linkButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(15)
        }
        self.horizontalLine.snp.makeConstraints { make in
            make.top.equalTo(seletAllButton.snp.bottom).offset(10)
            make.height.equalTo(1.5)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        self.checkBoxTableView.snp.makeConstraints { make in
            make.top.equalTo(horizontalLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
        }
        
        self.checkBoxStackView.snp.makeConstraints { make in
            make.top.equalTo(checkBoxTableView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        self.startButton.snp.makeConstraints { make in
            make.top.equalTo(checkBoxStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
    }
   
//    }
}
