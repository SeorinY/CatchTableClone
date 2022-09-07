//
//  CSTextField.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

class CSTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray
        self.layer.cornerRadius = 7
    }
}
