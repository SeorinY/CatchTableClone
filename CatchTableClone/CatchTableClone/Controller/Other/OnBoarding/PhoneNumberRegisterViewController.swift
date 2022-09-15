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
        $0.font = Font.generalFont
        $0.changeTextColor("*")
    }
    
    private let nameTextField = CSTextField("  이름을 입력해 주세요.")
    
    private let nameWarningLabel = UILabel().then {
        $0.text = "레스토랑을 예약할 때 이름이므로 꼭 실명을 사용해 주세요."
        $0.font = Font.lightFont
    }
    
    private let phoneNumberLabel = UILabel().then {
        $0.text = "휴대폰 번호 *"
        $0.font = Font.generalFont
        $0.changeTextColor("*")
    }
    private let questionmarkButton = UIButton().then{
        let buttonImage = UIImage(systemName: "questionmark.circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        $0.setImage(buttonImage, for: .normal)
    }
    private let phoneNumberTextField = CSTextField("  숫자만 입력해 주세요.", .default, .numberPad)
    private let phoneNumberButton = generalButton(.wait, "인증번호 요청")
    
    private let passWordLabel = UILabel().then {
        $0.text = "비밀 번호 *"
        $0.font = Font.generalFont
        $0.changeTextColor("*")
    }
    private let passwordTextField = CSTextField("  비밀번호를 입력해 주세요.")
    
    private let passwordCheckTextField = CSTextField("  비밀번호를 다시 한번 입력해 주세요.")
    
    private let passwordWarningLabel = UILabel().then {
        $0.text = "6자리 이상으로 설정해 주세요."
        $0.font = Font.lightFont
        
    }
    private let nickNameLabel = UILabel().then {
        $0.text = "닉네임 (선택)"
        $0.font = Font.generalFont
    }
    
    private let nickNameTextField = CSTextField("  닉네임을 입력해 주세요.")
    private let phone_linkLabel = UILabel().then {
        $0.text = "전화-링크 예약 앱에 연동하기 (선택)"
        $0.font = Font.generalFont
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
        //        $0.allowsSelection = false
        $0.allowsMultipleSelection = true
    }
    //    private var
    private let pushAlarmCheckBoxButton = CheckBoxButton(" 푸시 알림")
    private let SMSCheckBoxButton = CheckBoxButton(" SMS수신")
    private let emailCheckBoxButton = CheckBoxButton(" 이메일 수신")
    private var tableViewCheckBoxCount = 0
    private var alarmCheckBoxCount = 0
    
    private let maxAlarmCheckBoxCount = 3
    private let maxTableViewCheckBoxCount = 5
    
    private let checkBoxStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 1
    }
    
    private let startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = UIColor(named: "logoColor")
        $0.layer.cornerRadius = 8
    }
    
    private let questionPopOverView = PopOverView(Message.warningMessage[0])
    private let phone_linkPopOverView = PopOverView(Message.warningMessage[1])
        
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxTableView.delegate = self
        checkBoxTableView.dataSource = self
        navigationLabel("회원가입")
        addAction()
        self.setUI()
        self.setLayout()
        self.setHiddenLayout()
    }
    
    
}

extension PhoneNumberRegisterViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Message.checkBoxItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = checkBoxTableView.dequeueReusableCell(withIdentifier: "checkBoxCell", for: indexPath) as! PhoneNumberRegisterCell
        cell.configure(Message.checkBoxItem[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkBoxTableView.deselectRow(at: indexPath, animated: false)
        let cell = checkBoxTableView.cellForRow(at: indexPath) as! PhoneNumberRegisterCell
        cell.pressedButton()
        
        if indexPath.row == 4 {
            pushAlarmCheckBoxButton.styleConfigure(cell.checkBoxState)
            SMSCheckBoxButton.styleConfigure(cell.checkBoxState)
            emailCheckBoxButton.styleConfigure(cell.checkBoxState)
            if cell.checkBoxState == .unCheck {
                alarmCheckBoxCount = 0
            } else {
                alarmCheckBoxCount = maxAlarmCheckBoxCount
            }
        }
        
        if cell.checkBoxState == .unCheck {
            tableViewCheckBoxCount = tableViewCheckBoxCount - 1
        } else {
            tableViewCheckBoxCount = tableViewCheckBoxCount + 1
        }
        checkSeletAllButton()
    }
}

//MARK: action

extension PhoneNumberRegisterViewController {
    func addAction() {
        phoneNumberTextField.addTarget(self, action: #selector(canSendCertification), for: .editingChanged)
        phone_linkButton.addTarget(self, action: #selector(phone_linkButtonPressed), for: .touchUpInside)
        questionmarkButton.addTarget(self, action: #selector(questionmarkButtonPressed), for: .touchUpInside)
        seletAllButton.addTarget(self, action: #selector(selectAllPresserd), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        pushAlarmCheckBoxButton.addTarget(self, action: #selector(alarmCheckBoxButtonPressed), for: .touchUpInside)
        SMSCheckBoxButton.addTarget(self, action: #selector(alarmCheckBoxButtonPressed), for: .touchUpInside)
        emailCheckBoxButton.addTarget(self, action: #selector(alarmCheckBoxButtonPressed), for: .touchUpInside)
    }
    
    @objc private func canSendCertification(){
        if phoneNumberTextField.text?.count ?? 0 < 10{
            phoneNumberButton.styleConfigure(.wait)
        }else{
            phoneNumberButton.styleConfigure(.ready)
        }
    }
    
    @objc func questionmarkButtonPressed() {
        questionmarkButton.isHidden = false
        questionPopOverView.viewAppear()
    }
    
    
    @objc private func phone_linkButtonPressed() {
        let indexPath = IndexPath(row: 3, section: 0)
        phone_linkButton.didClickButton()
        let cell = checkBoxTableView.cellForRow(at: indexPath) as! PhoneNumberRegisterCell
        cell.buttonCheck(phone_linkButton.style)
    }
    
    @objc func selectAllPresserd(){
        seletAllButton.didClickButton()
        
        let checkBoxStyle = seletAllButton.style
        
        if checkBoxStyle == .unCheck {
            alarmCheckBoxCount = 0
            tableViewCheckBoxCount = 0
        } else {
            alarmCheckBoxCount = maxAlarmCheckBoxCount
            tableViewCheckBoxCount = maxTableViewCheckBoxCount
        }
        SMSCheckBoxButton.styleConfigure(checkBoxStyle)
        emailCheckBoxButton.styleConfigure(checkBoxStyle)
        pushAlarmCheckBoxButton.styleConfigure(checkBoxStyle)
        
        for section in 0..<checkBoxTableView.numberOfSections {
            for row in 0..<checkBoxTableView.numberOfRows(inSection: section) {
                let cell = checkBoxTableView.cellForRow(at: [section,row]) as! PhoneNumberRegisterCell
                cell.buttonCheck(checkBoxStyle)
            }
        }
    }
    @objc func startButtonPressed() {
        print("start")
    }
    
    @objc func alarmCheckBoxButtonPressed(_ sender: CheckBoxButton) {
        sender.didClickButton()
        alarmCheckBoxCount = sender.style == .unCheck ? alarmCheckBoxCount - 1 : alarmCheckBoxCount + 1

        
        let indexPath = IndexPath(row: 4, section: 0)
        let cell = checkBoxTableView.cellForRow(at: indexPath) as! PhoneNumberRegisterCell
        if alarmCheckBoxCount == maxAlarmCheckBoxCount {
            tableViewCheckBoxCount = cell.checkBoxState == .unCheck ? tableViewCheckBoxCount + 1: tableViewCheckBoxCount
            cell.buttonCheck(.check)
        } else {
            tableViewCheckBoxCount = cell.checkBoxState == .check ? tableViewCheckBoxCount - 1: tableViewCheckBoxCount
            cell.buttonCheck(.unCheck)
        }
        
        checkSeletAllButton()
    }
    func checkSeletAllButton() {
        if tableViewCheckBoxCount == maxTableViewCheckBoxCount {
            seletAllButton.styleConfigure(.check)
        } else {
            seletAllButton.styleConfigure(.unCheck)
        }
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
        contentView.addSubview(questionPopOverView)
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
    
    func setHiddenLayout() {
        questionPopOverView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(questionmarkButton.snp.bottom).offset(20)
            make.width.equalTo(340)
            make.height.equalTo(35)
        }
        
        phone_linkPopOverView.snp.makeConstraints { make in
            
        }
    }
}
