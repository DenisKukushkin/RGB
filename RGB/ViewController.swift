//
//  ViewController.swift
//  RGB
//
//  Created by kukushkin-ds on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var screen: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    
    func colorValueToText(colorValue: CGFloat) -> String {
        String(Float(round(colorValue * 100) / 100))
    }
    
    func colorValueToFloat(colorValue: CGFloat) -> Float {
        Float(round(colorValue * 100) / 100)
    }
    
    func screenColor(of redSlider: UISlider, _ greenSlider: UISlider, _ blueSlider: UISlider) -> UIColor {
        UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),alpha: 1
        )

        screen.layer.cornerRadius = 15
        
        redLabel.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        greenLabel.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        blueLabel.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        
        redSlider.tintColor = .systemRed
        greenSlider.tintColor = .systemGreen
        blueSlider.tintColor = .systemBlue
        
    }
    
    @IBAction func redSliderAction() {
        redLabel.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        screen.backgroundColor = screenColor(of: redSlider, greenSlider, blueSlider)
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        screen.backgroundColor = screenColor(of: redSlider, greenSlider, blueSlider)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        screen.backgroundColor = screenColor(of: redSlider, greenSlider, blueSlider)
    }
 
}

