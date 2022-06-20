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

    var red:CGFloat = 0.38
    var green:CGFloat = 0.72
    var blue:CGFloat = 0.47
    
    func colorValueToText(colorValue: CGFloat) -> String {
        String(Float(round(colorValue * 100) / 100))
    }
    
    func colorValueToFloat(colorValue: CGFloat) -> Float {
        Float(round(colorValue * 100) / 100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        screen.layer.cornerRadius = 15
        
        
        redLabel.text = colorValueToText(colorValue: red)
        greenLabel.text = colorValueToText(colorValue: green)
        blueLabel.text = colorValueToText(colorValue: blue)
        
        redSlider.tintColor = .systemRed
        greenSlider.tintColor = .systemGreen
        blueSlider.tintColor = .systemBlue
        
        redSlider.value = colorValueToFloat(colorValue: red)
        greenSlider.value = colorValueToFloat(colorValue: green)
        blueSlider.value = colorValueToFloat(colorValue: blue)
        
    }
    
    @IBAction func redSliderAction() {
        red = CGFloat(redSlider.value)
        redLabel.text = colorValueToText(colorValue: red)
        screen.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            }
    
    @IBAction func greenSliderAction() {
        green = CGFloat(greenSlider.value)
        greenLabel.text = colorValueToText(colorValue: green)
        screen.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blue = CGFloat(blueSlider.value)
        blueLabel.text = colorValueToText(colorValue: blue)
        screen.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
 
}

