//
//  InquirePhotoCollectionViewCell.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/28.
//

import UIKit

class InquirePhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "InquirePhotoCollectionViewCell"
    public var imageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
        $0.tintColor = .systemGray4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.backgroundColor = .systemGray6
        contentView.clipsToBounds = true
        imageView.frame = bounds
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
