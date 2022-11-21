//
//  FEQViewController.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/12.
//

import UIKit

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
            make.width.equalTo(370)
            make.centerX.equalToSuperview()
        }
    }
}
extension FEQViewController : QuestionViewDelegate{
    func didTapOkButton() {
        dismiss(animated: false)
    }
}
