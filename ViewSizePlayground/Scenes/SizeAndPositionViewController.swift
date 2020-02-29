//
//  BoundsViewController.swift
//  ViewSizePlayground
//
//  Created by Roland Maksimovicz on 2020-02-29.
//  Copyright © 2020 macrol. All rights reserved.
//

import UIKit

class SizeAndPositionViewController: UIViewController {

    @IBOutlet private weak var testView: UIView!
    
    @IBOutlet weak var parentHeight: UILabel!
    @IBOutlet weak var parentWidth: UILabel!
    
    @IBOutlet weak var boundsX: SliderWithLabel!
    @IBOutlet weak var boundsY: SliderWithLabel!
    @IBOutlet weak var boundsWidth: SliderWithLabel!
    @IBOutlet weak var boundsHeight: SliderWithLabel!
    
    @IBOutlet weak var frameX: SliderWithLabel!
    @IBOutlet weak var frameY: SliderWithLabel!
    @IBOutlet weak var frameWidth: SliderWithLabel!
    @IBOutlet weak var frameHeight: SliderWithLabel!
    
    @IBOutlet weak var rotation: SliderWithLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "bounds and frame"
        
        setupCallbacks()

        resetView()
        
        parentHeight.text = "Main view total height = \(view.bounds.height)"
        parentWidth.text = "Main view total width = \(view.bounds.width)"
    }
    
    @IBAction func onResetPressed(_ sender: UIBarButtonItem) {
        resetView()
    }
    
    private func resetView() {
        testView.transform = CGAffineTransform.identity
        testView.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 120, height: 120))
        
        setSliderValues()
        updateLabels()
    }
    
    private func setupCallbacks() {
        boundsX.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.bounds.origin.x = CGFloat(slider.value)
            self.updateLabels()
        }
        
        boundsY.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.bounds.origin.y = CGFloat(slider.value)
            self.updateLabels()
        }
        
        boundsHeight.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.bounds.size.height = CGFloat(slider.value)
            self.updateLabels()
        }
        
        boundsWidth.callback = { [weak self] slider in
            guard let self = self else { return }
            self.testView.bounds.size.width = CGFloat(slider.value)
            self.updateLabels()
        }
        
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
        
        rotation.callback = { [weak self] slider in
            guard let self = self else { return }
            let rotation = CGAffineTransform(rotationAngle: CGFloat(slider.value))
            self.testView.transform = rotation
            
            self.updateLabels()
        }
    }
    
    private func setSliderValues() {
        boundsX.sliderView.maximumValue = Float(view.bounds.maxX)
        boundsY.sliderView.maximumValue = Float(view.bounds.maxY)
        boundsWidth.sliderView.maximumValue = Float(view.bounds.width)
        boundsHeight.sliderView.maximumValue = Float(view.bounds.height)
        
        boundsX.sliderView.value = Float(testView.bounds.origin.x)
        boundsY.sliderView.value = Float(testView.bounds.origin.y)
        boundsWidth.sliderView.value = Float(testView.bounds.size.width)
        boundsHeight.sliderView.value = Float(testView.bounds.size.height)
        
        frameX.sliderView.maximumValue = Float(view.frame.maxX)
        frameY.sliderView.maximumValue = Float(view.frame.maxY)
        frameWidth.sliderView.maximumValue = Float(view.frame.width)
        frameHeight.sliderView.maximumValue = Float(view.frame.height)
        
        frameX.sliderView.value = Float(testView.frame.origin.x)
        frameY.sliderView.value = Float(testView.frame.origin.y)
        frameWidth.sliderView.value = Float(testView.frame.size.width)
        frameHeight.sliderView.value = Float(testView.frame.size.height)
        
        rotation.sliderView.maximumValue = Float.pi * 2
        rotation.sliderView.value = 0
    }
    
    private func updateLabels() {
        boundsX.labelView.text = "bounds x = \(Int(testView.bounds.origin.x))"
        boundsY.labelView.text = "bounds y = \(Int(testView.bounds.origin.y))"
        boundsWidth.labelView.text = "bounds width = \(Int(testView.bounds.width))"
        boundsHeight.labelView.text = "bounds height = \(Int(testView.bounds.height))"
        
        frameX.labelView.text = "frame x = \(Int(testView.frame.origin.x))"
        frameY.labelView.text = "frame y = \(Int(testView.frame.origin.y))"
        frameWidth.labelView.text = "frame width = \(Int(testView.frame.width))"
        frameHeight.labelView.text = "frame height = \(Int(testView.frame.height))"
        
        rotation.labelView.text = "rotation = \(rotation.sliderView.value)"
    }
}
