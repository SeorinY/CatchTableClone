import UIKit
import SnapKit

class CSTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    
    required init(_ placeHolder: String, _ returnType: UIReturnKeyType = .default, _ keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        self.placeholder = placeHolder
        self.returnKeyType = returnType
        self.keyboardType = keyboardType
        self.backgroundColor = UIColor(red: 247.0 / 255.0, green: 247.0 / 255.0, blue: 247.0 / 255.0, alpha: 1)
        self.layer.cornerRadius = 8
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(_ target: ConstraintRelatableTarget) {
        self.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
            make.top.equalTo(target).offset(10)
        }
    }
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        let rect = super.textRect(forBounds: bounds)
//        return rect.inset(by: padding)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        let rect = super.editingRect(forBounds: bounds)
//        return rect.inset(by: padding)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class underLineLoginTextField : UITextField{
    let line = UIView()
    required init(_ placehorder: String) {
        super.init(frame: .zero)
        self.placeholder = placehorder
        self.returnKeyType = .default
        lineConfigure(true)
        addSubview(line)
        line.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    public func lineConfigure(_ empty : Bool){
        if empty == true{ line.backgroundColor = .secondarySystemBackground }
        else{ line.backgroundColor = .black }
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    private var eyeButton : UIButton?
    public func buttonConfigure(){
        eyeButton = UIButton()
        eyeButton?.showsTouchWhenHighlighted = true
        eyeButton?.tintColor = .systemGray4
        rightViewMode = .always
        rightView = eyeButton
        eyeButton?.addTarget(self, action: #selector(didTapEyeButton), for: .touchUpInside)

        isSecureTextEntry = true
        eyeButton?.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    }
    @objc func didTapEyeButton(){
        isSecureTextEntry.toggle()
        if isSecureTextEntry == true{
            eyeButton?.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }else{
            eyeButton?.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
}
class CheckBoxButton : UIButton {
    enum buttonStyle {
        case check
        case unCheck
    }
    var style : buttonStyle

    required init( _ text: String, _ buttonStyle: buttonStyle = .unCheck) {
        self.style = buttonStyle
        super.init(frame: .zero)
        styleConfigure(buttonStyle)
        self.layer.cornerRadius = 8
        self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        self.backgroundColor = .systemBackground
        self.setTitleColor(.black, for: .normal)
        self.setTitle("  \(text)", for: .normal)
        self.titleLabel?.font = Font.generalFont
        self.semanticContentAttribute = .forceLeftToRight
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .leading
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    public func didClickButton() {
        if self.style == .check {
            styleConfigure(.unCheck)
        } else {
            styleConfigure(.check)
        }
    }
    public func styleConfigure(_ buttonStyle : buttonStyle){
        style = buttonStyle
        if buttonStyle == .check{
            self.tintColor = UIColor(named: "logoColor")
        }
        else if buttonStyle == .unCheck{
            self.tintColor = UIColor(named: "buttonBackgroundColor")
        }
    }
    
    //    button.backgroundColor = UIColor(red: 253.0 / 255.0, green: 227.0 / 255.0, blue: 10.0 / 255.0, alpha: 1)
}

class generalButton : UIButton{
    enum buttonStyle{
        case ready
        case wait
    }
    var style : buttonStyle
    required init(_ buttonStyle : buttonStyle, _ text: String){
        style = buttonStyle
        super.init(frame: .zero)
        self.titleLabel?.font = Font.generalFont
        self.setTitleColor(.systemGray, for: .normal)
        self.setTitle(text, for: .normal)
        self.styleConfigure(buttonStyle)
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func styleConfigure(_ buttonStyle : buttonStyle){
        style = buttonStyle
        if buttonStyle == .ready{
            self.backgroundColor = UIColor(named: "logoColor")
            self.setTitleColor(.white, for: .normal)
        }
        else if buttonStyle == .wait{
            self.backgroundColor = UIColor(named: "buttonBackgroundColor")
            self.setTitleColor(.secondaryLabel, for: .normal)
        }
    }
}

