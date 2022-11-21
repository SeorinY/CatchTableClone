//
//  UIViewController+.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

extension UIViewController {
    func navigationBackBtnLayout() {
        let backImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func navigationLabel(_ text: String) {
        let registerLabel = UILabel()
        registerLabel.text = text
        registerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: registerLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}
