//
//  PopOverViewController.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/15.
//

import UIKit
import SnapKit
import Then

class PopOverViewController: UIViewController {
    private let label = UILabel().then {
        $0.text = "레스토랑 예약, 알림을 제공하기 위해 휴대폰 번호를 사용한 본인 인증이 필요합니다. 본인 인증 시 수집된 개인정보는 캐치테이블 서비스 외 다른 용도로 사용되지 않습니다."
        $0.font = Font.lightFont
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(label)
        self.view.backgroundColor = UIColor(red: 92.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-2)
        }
    }

}
