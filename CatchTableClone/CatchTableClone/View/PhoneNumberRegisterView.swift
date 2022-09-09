//
//  RegisterView.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

class PhoneNumberRegisterView: UIScrollView {
    private let contentView : UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addSubview(contentView)
        addContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
    }
    
    private func addContentView() {
        
    }
    

}
