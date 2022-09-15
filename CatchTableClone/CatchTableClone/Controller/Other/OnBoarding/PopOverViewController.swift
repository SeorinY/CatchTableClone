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
        $0.font = Font.lightFont
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    private var tapOutsideRecognizer: UITapGestureRecognizer!

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    public func setText(_ text: String) {
        label.text = text
    }
}

extension PopOverViewController: UIGestureRecognizerDelegate {
    
    
    func close(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Gesture methods to dismiss this with tap outside
    @objc func handleTapBehind(sender: UITapGestureRecognizer) {
        if (sender.state == UIGestureRecognizer.State.ended) {
            let location: CGPoint = sender.location(in: self.view)

            if (!self.view.point(inside: location, with: nil)) {
                self.view.window?.removeGestureRecognizer(sender)
                self.close(sender: sender)
            }
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
