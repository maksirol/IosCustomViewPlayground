//
//  FrameViewController.swift
//  ViewSizePlayground
//
//  Created by Roland Maksimovicz on 2020-02-28.
//  Copyright © 2020 macrol. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {
    
    @IBOutlet private weak var testView: UIView!
    
    @IBOutlet weak var parentHeight: UILabel!
    @IBOutlet weak var parentWidth: UILabel!
    
    @IBOutlet weak var frameX: SliderWithLabel!
    @IBOutlet weak var frameY: SliderWithLabel!
    @IBOutlet weak var frameWidth: SliderWithLabel!
    @IBOutlet weak var frameHeight: SliderWithLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCallbacks()
        updateLabels()
        setSliderValues()
        
        parentHeight.text = "Main view total height = \(view.frame.height)"
        parentWidth.text = "Main view total width = \(view.frame.width)"
    }
    
    private func setupCallbacks() {
        frameX.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.frame.origin.x = CGFloat(slider.value)
            self.updateLabels()
        }
        
        frameY.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.frame.origin.y = CGFloat(slider.value)
            self.updateLabels()
        }
        
        frameHeight.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.frame.size.height = CGFloat(slider.value)
            self.updateLabels()
        }
        
        frameWidth.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.frame.size.width = CGFloat(slider.value)
            self.updateLabels()
        }
    }
    
    private func setSliderValues() {
        frameX.sliderView.maximumValue = Float(view.frame.maxX)
        frameY.sliderView.maximumValue = Float(view.frame.maxY)
        frameWidth.sliderView.maximumValue = Float(view.frame.width)
        frameHeight.sliderView.maximumValue = Float(view.frame.height)
        
        frameX.sliderView.value = Float(testView.frame.origin.x)
        frameY.sliderView.value = Float(testView.frame.origin.y)
        frameWidth.sliderView.value = Float(testView.frame.size.width)
        frameHeight.sliderView.value = Float(testView.frame.size.height)
    }
    
    private func updateLabels() {
        frameX.labelView.text = "frame x = \(Int(testView.frame.origin.x))"
        frameY.labelView.text = "frame y = \(Int(testView.frame.origin.y))"
        frameWidth.labelView.text = "frame width = \(Int(testView.frame.width))"
        frameHeight.labelView.text = "frame height = \(Int(testView.frame.height))"
    }
}
