//
//  QuestionView.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

protocol QuestionViewDelegate : AnyObject{
    func didTapOkButton()
}
class QuestionView: UIView {
    
    public weak var delegate : QuestionViewDelegate?
    
    private let feqLabel  = UILabel().then {
        $0.text = "자주 묻는 질문"
        $0.font = .systemFont(ofSize: 30, weight: .black)
    }
    private let feqTextView = UITextView().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 15)
    }
    private let okButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 252.0 / 255.0, green: 35.0 / 255.0, blue: 6.0 / 255.0, alpha: 1)
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 7
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureFeq()
        configureButton()
    }
    
    private func configureFeq(){
        addSubview(feqLabel)
        addSubview(feqTextView)
        for x in 0..<FEQ.list.count{
            feqTextView.text.append("Q. ")
            feqTextView.text.append(FEQ.list[x].question)
            feqTextView.text.append("A. ")
            feqTextView.text.append(FEQ.list[x].enswer)
            feqTextView.text.append("\n")
        }
    }
    private func configureButton(){
        addSubview(okButton)
        okButton.addTarget(self, action: #selector(didTapOkButton), for: .touchUpInside)
    }
    
    @objc private func didTapOkButton(){
        delegate?.didTapOkButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        feqLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        feqTextView.snp.makeConstraints { make in
            make.top.equalTo(feqLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.lessThanOrEqualTo(height*4/5)
        }
        okButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
}
