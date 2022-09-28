//
//  InquireViewController.swift
//  CatchTableClone
//
//  Created by jung on 2022/09/07.
//

import UIKit

class InquireViewController: UIViewController{
    
    private let titleCSTextField = CSTextField("제목을 입력해 주세요.")
    private let inquireCSTextField = CSTextField("문의사항을 입력해 주세요.").then {
        $0.contentVerticalAlignment = .top
    }
    private let emailAddressCSTextField = CSTextField("답변 받을 이메일 주소를 입력해 주세요.")
    lazy var imagePicker = UIImagePickerController().then {
        $0.sourceType = .photoLibrary
    }
    private var photoCollectionView : UICollectionView?
    
    private let explainTextView = UITextView().then {
        $0.text = Message.inquireMessage
        $0.font = Font.lightFont
    }
    
    private let agreeButton = CheckBoxButton("위 내용에 동의합니다.").then {
        $0.addTarget(self, action: #selector(didTapagreeButton), for: .touchUpInside)
    }
    @objc private func didTapagreeButton(){
        agreeButton.didClickButton()
    }
    
    private let inquireButton = generalButton(.ready, "문의하기")
    
    private var image = [UIImage]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationLabel("회원가입 문의")
        configureSubView()
        setSubViewLayout()
    }
    private func configureSubView(){
        view.addSubview(titleCSTextField)
        view.addSubview(inquireCSTextField)
        view.addSubview(emailAddressCSTextField)
        view.addSubview(explainTextView)
        view.addSubview(agreeButton)
        view.addSubview(inquireButton)
        imagePicker.delegate = self
        
        configureImageCollection()
    }
    private func setSubViewLayout(){
        titleCSTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(100)
        }
        
        inquireCSTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(100)
            make.top.equalTo(titleCSTextField.snp.bottom).offset(10)
        }
        emailAddressCSTextField.setLayout(inquireCSTextField.snp.bottom)
        
        photoCollectionView?.snp.makeConstraints { make in
            make.top.equalTo(emailAddressCSTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(120)
        }
        
        explainTextView.snp.makeConstraints { make in
            make.top.equalTo(photoCollectionView!.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(120)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.top.equalTo(explainTextView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(20)
        }
        
        inquireButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(agreeButton.snp.bottom).offset(10)
            make.height.equalTo(44)
        }
    }
    
    private func configureImageCollection(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100 , height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.minimumInteritemSpacing = 10
        photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollectionView?.register(InquirePhotoCollectionViewCell.self, forCellWithReuseIdentifier: InquirePhotoCollectionViewCell.identifier)
        photoCollectionView?.showsHorizontalScrollIndicator = false
        photoCollectionView?.delegate = self
        photoCollectionView?.dataSource = self
        guard let photoCollectionView = photoCollectionView else {
            return
        }
        view.addSubview(photoCollectionView)
    }
}

extension InquireViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //모달을 내려주기만 하자
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //받아온 이미지를 cell 에 세탕해주는 코드
        
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage{
            image.append(originalImage)
        }
        self.photoCollectionView?.reloadData()
        //창을 내려주자
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension InquireViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if indexPath.row == 0{
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Cell reuse 푸는 법도 해보기 -> 아래 center 주석 취소
        guard var cell = photoCollectionView?.dequeueReusableCell(withReuseIdentifier: InquirePhotoCollectionViewCell.identifier, for: indexPath) as? InquirePhotoCollectionViewCell else{
            return InquirePhotoCollectionViewCell()
        }
        
        if indexPath.row == 0 {
            let image = UIImage(systemName: "photo")
//            cell.imageView.contentMode = .center
            cell.imageView.image = image
        }else{
            cell.imageView.image = image[indexPath.row-1]
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1 + image.count
    }
}
