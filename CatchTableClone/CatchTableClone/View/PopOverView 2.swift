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
    private var tapOutsideRecognizer: UITapGestureRecognizer!
    private lazy var label = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 9.4, weight: .light)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    required init(_ text: String){
        super.init(frame: .zero)
        self.backgroundColor = .systemGray
        self.layer.cornerRadius = 7
        self.addSubview(label)
        self.setLayout()

        self.label.text = text

        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}

//MARK: UIGestureRecognizerDelegate
extension PopOverView: UIGestureRecognizerDelegate {
    func viewAppear() {
        self.isHidden = false
        if (self.tapOutsideRecognizer == nil) {
            self.tapOutsideRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBehind))
            self.tapOutsideRecognizer.numberOfTapsRequired = 1
            self.tapOutsideRecognizer.cancelsTouchesInView = false
            self.tapOutsideRecognizer.delegate = self
            self.window?.addGestureRecognizer(self.tapOutsideRecognizer)
        }
    }
    func viewWillDisMiss() {
        self.isHidden = true
        if(self.tapOutsideRecognizer != nil) {
            self.window?.removeGestureRecognizer(self.tapOutsideRecognizer)
            self.tapOutsideRecognizer = nil
        }
    }
    
    // MARK: - Gesture methods to dismiss this with tap outside
    @objc func handleTapBehind(sender: UITapGestureRecognizer) {
        if (sender.state == UIGestureRecognizer.State.ended) {
            let location: CGPoint = sender.location(in: self)
            print(location)
            if (!self.point(inside: location, with: nil)) {
                self.window?.removeGestureRecognizer(sender)
                self.viewWillDisMiss()
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
