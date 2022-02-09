//
//  DIyCornerAdjustV.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/12.
//

import UIKit

class DIyCornerAdjustV: UIView {

    var cornerChangeBlock: ((CGFloat)->Void)?
    var sizeChangeBlock: ((CGFloat)->Void)?
    let cornerSlider: UISlider = UISlider()
    let sizeSlider: UISlider = UISlider()
    var cornerValueLabel = UILabel()
    var sizeValueLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        var cornerLabel = UILabel()
        cornerLabel.fontName(20, "GillSans")
            .color(.white)
            .text("Corner")
            .adhere(toSuperview: self)
        cornerLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(10)
            $0.width.height.greaterThanOrEqualTo(48)
        }
        
        
        var sizeLabel = UILabel()
        sizeLabel.fontName(20, "GillSans")
            .color(.white)
            .text("Size")
            .adhere(toSuperview: self)
        sizeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalTo(cornerLabel.snp.bottom).offset(0)
            $0.width.height.greaterThanOrEqualTo(48)
        }
        

        cornerValueLabel.fontName(20, "GillSans")
            .color(.white)
            .text("50")
            .adhere(toSuperview: self)
        cornerValueLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalTo(cornerLabel.snp.centerY).offset(0)
            $0.width.height.greaterThanOrEqualTo(48)
        }
        
        
        
        sizeValueLabel.fontName(20, "GillSans")
            .color(.white)
            .text("50")
            .adhere(toSuperview: self)
        sizeValueLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalTo(sizeLabel.snp.centerY).offset(0)
            $0.width.height.greaterThanOrEqualTo(48)
        }
        

        cornerSlider.setThumbImage(UIImage(named: "editor_slider"), for: .normal)
        cornerSlider.minimumTrackTintColor = UIColor(hexString: "#3D98E7")
        cornerSlider.maximumTrackTintColor = UIColor(hexString: "#39464C")
        cornerSlider.minimumValue = 0
        cornerSlider.maximumValue = 1
        cornerSlider.value = 0.5
        cornerSlider.adhere(toSuperview: self)
        cornerSlider.snp.makeConstraints {
            $0.left.equalToSuperview().offset(88)
            $0.centerY.equalTo(cornerLabel.snp.centerY)
            $0.height.equalTo(34)
            $0.right.equalToSuperview().offset(-88)
        }
        cornerSlider.addTarget(self, action: #selector(cornderSlideValueChange(sender: )), for: .valueChanged)
        
        
        sizeSlider.setThumbImage(UIImage(named: "editor_slider"), for: .normal)
        sizeSlider.minimumTrackTintColor = UIColor(hexString: "#3D98E7")
        sizeSlider.maximumTrackTintColor = UIColor(hexString: "#39464C")
        sizeSlider.minimumValue = 0
        sizeSlider.maximumValue = 1
        sizeSlider.value = 0.5
        sizeSlider.adhere(toSuperview: self)
        sizeSlider.snp.makeConstraints {
            $0.left.equalToSuperview().offset(88)
            $0.centerY.equalTo(sizeLabel.snp.centerY)
            $0.height.equalTo(34)
            $0.right.equalToSuperview().offset(-88)
        }
        sizeSlider.addTarget(self, action: #selector(sizeSlideValueChange(sender: )), for: .valueChanged)
        
        
    }
    
    
    @objc func cornderSlideValueChange(sender: UISlider) {
        let width = (UIScreen.width - 64 * 2)
        let value = (width / 2) * CGFloat(sender.value)
        
        cornerChangeBlock?(value)
        
        cornerValueLabel.text("\(Int(100 * sender.value))")
    }
    
    @objc func sizeSlideValueChange(sender: UISlider) {
        let maxWidth: CGFloat = UIScreen.width - 64 * 2 - 50 * 2
        let minWidth: CGFloat = 44
        
        let width: CGFloat = minWidth + ((maxWidth - minWidth) * CGFloat(sender.value))
        
        sizeChangeBlock?(width)
        
        sizeValueLabel.text("\(Int(100 * sender.value))")
    }

}
