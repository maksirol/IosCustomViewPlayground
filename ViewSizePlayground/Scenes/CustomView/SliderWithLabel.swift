//
//  SliderWithLabel.swift
//  ViewSizePlayground
//
//  Created by Roland Maksimovicz on 2020-02-28.
//  Copyright © 2020 macrol. All rights reserved.
//

import UIKit

@IBDesignable
class SliderWithLabel: UIView {
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var labelView: UILabel!
    public var callback: ((UISlider) -> Void)?
    
    @IBAction func onChange(_ sender: UISlider) {
        callback?(sender)
    }
    
    override var intrinsicContentSize: CGSize {
        return self.frame.size
    }
    
    //MARK: initialize view from nib
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SliderWithLabel", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
