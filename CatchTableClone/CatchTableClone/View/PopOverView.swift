//
//  PopOverView.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/15.
//

import UIKit
import Then
import SnapKit
//https://thecosmos.tistory.com/4
//https://stackoverflow.com/questions/9102497/dismiss-modal-view-form-sheet-controller-on-outside-tap
//recognize!!!
class PopOverView: UIView {
    private lazy var label = UILabel().then {
        $0.font = Font.lightFont
        $0.textColor = .white
        //        $0.text = "레스토랑 예약, 알림을 제공하기 위해 휴대폰 번호를 사용한 본인 인증이 필요합니다. 본인 인증 시 수집된 개인정보는 캐치테이블 서비스 외 다른 용도로 사용되지 않습니다."
    }
    
    required init(_ text: String){
        super.init(frame: .zero)
        self.label.text = text
        self.addSubview(label)
        self.isHidden = true
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
