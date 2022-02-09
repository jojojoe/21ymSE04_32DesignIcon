//
//  DIymColorCollection.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/12.
//

import UIKit

class DIymColorCollection: UIView {
    var collection: UICollectionView!
    var itemClickBlock: ((String, Bool)->Void)?
    var currentItem: String?
    var colorList: [String] = []
    
    init(frame: CGRect, colorList: [String]) {
        self.colorList = colorList
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        addSubview(collection)
        collection.snp.makeConstraints {
            $0.top.bottom.right.left.equalToSuperview()
        }
        collection.register(cellWithClass: DIymColorCell.self)
    }
}

extension DIymColorCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: DIymColorCell.self, for: indexPath)
        let item = colorList[indexPath.item]
        cell.contentImgV.image = nil
        cell.contentImgV.backgroundColor(UIColor(hexString: item) ?? UIColor.white)
        
        if indexPath.item <= 1 {
            cell.vipImgV.isHidden = true
        } else {
            cell.vipImgV.isHidden = false
        }
        
        
        if currentItem == item {
            cell.selectV.isHidden = false
        } else {
            cell.selectV.isHidden = true
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension DIymColorCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

extension DIymColorCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = colorList[indexPath.item]
        self.currentItem = item
        var vip: Bool = false
        if indexPath.item > 1 {
            vip = true
        }
        itemClickBlock?(item, vip)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}


class DIymColorCell: UICollectionViewCell {
    let contentImgV = UIImageView()
    let selectV = UIView()
    let vipImgV = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentImgV.contentMode = .scaleAspectFit
        contentImgV.clipsToBounds = true
        contentView.addSubview(contentImgV)
        contentImgV.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(64)
        }
        contentImgV.layer.cornerRadius = 64/2
        //
        selectV.clipsToBounds = true
        contentView.addSubview(selectV)
        selectV.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(64)
        }
        selectV.backgroundColor(.clear)
        selectV.layer.borderColor = UIColor(hexString: "#FFDC4D")!.cgColor
        selectV.layer.borderWidth = 3
        selectV.layer.masksToBounds = true
        selectV.layer.cornerRadius = 64/2
        //
        let selectV2 = UIView()
        selectV2.clipsToBounds = true
        selectV.addSubview(selectV2)
        selectV2.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(61)
        }
        selectV2.backgroundColor(.clear)
        selectV2.layer.borderColor = UIColor(hexString: "#39464D")!.cgColor
        selectV2.layer.borderWidth = 6
        selectV2.layer.masksToBounds = true
        selectV2.layer.cornerRadius = 61/2
        
        //
        vipImgV.image("editor_diamond")
        vipImgV.contentMode = .scaleAspectFit
        vipImgV.clipsToBounds = true
        contentView.addSubview(vipImgV)
        vipImgV.snp.makeConstraints {
            $0.top.right.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
    }
}




