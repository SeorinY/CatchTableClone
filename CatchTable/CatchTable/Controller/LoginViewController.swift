//
//  LoginViewController.swift
//  CatchTable
//
//  Created by Mac Book Pro on 2022/09/05.
//

import UIKit

class LoginViewController: UIViewController {
    private let kakaoLoginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(kakaoLoginButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        kakaoLoginButton.frame = CGRect(x: view.left+20, y: view.height/3, width: view.width, height: 30)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
