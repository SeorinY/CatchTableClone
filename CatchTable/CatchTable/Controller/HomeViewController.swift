//
//  ViewController.swift
//  CatchTable
//
//  Created by Mac Book Pro on 2022/09/05.
//

import UIKit
/*
class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
 */

class HomeViewController: UIViewController {

    private var titleView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.text = "Service Login"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    private var idField: UITextField = {
        let idField = UITextField()
        idField.placeholder = "Enter your ID."
        idField.backgroundColor = .white
        return idField
    }()
    private var pwField: UITextField = {
        let pwField = UITextField()
        pwField.placeholder = "Enter your PW."
        pwField.backgroundColor = .white
        return pwField
    }()
    
    private var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 10
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainLayout()
    }
    
    
    private func setupMainLayout() {
        view.addSubview(titleView)
        view.addSubview(idField)
        view.addSubview(pwField)
        view.addSubview(loginButton)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        idField.translatesAutoresizingMaskIntoConstraints = false
        pwField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        titleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        idField.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16).isActive = true
        idField.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        idField.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        idField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        pwField.topAnchor.constraint(equalTo: idField.bottomAnchor, constant: 16).isActive = true
        pwField.leadingAnchor.constraint(equalTo: idField.leadingAnchor).isActive = true
        pwField.trailingAnchor.constraint(equalTo: idField.trailingAnchor).isActive = true
        pwField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: pwField.bottomAnchor, constant: 16).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: pwField.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: pwField.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
