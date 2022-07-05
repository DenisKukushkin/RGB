//
//  ViewController.swift
//  RGB
//
//  Created by kukushkin-ds on 18.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet var smallScreen: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
    var smallScreenColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    
    func colorValueToText(colorValue: CGFloat) -> String {
        String(Float(round(colorValue * 100) / 100))
    }
    
    func setScreenColor(of redSlider: UISlider, _ greenSlider: UISlider, _ blueSlider: UISlider) -> UIColor {
        UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        redTextField.inputAccessoryView = doneToolbar
        greenTextField.inputAccessoryView = doneToolbar
        blueTextField.inputAccessoryView = doneToolbar
        
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        guard let screenColorComponents = smallScreenColor.components else { return }
            redSlider.value = Float(screenColorComponents.red)
            greenSlider.value = Float(screenColorComponents.green)
            blueSlider.value = Float(screenColorComponents.blue)

        smallScreen.backgroundColor = setScreenColor(of: redSlider, greenSlider, blueSlider)
        smallScreen.layer.cornerRadius = 15
        
        redLabel.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        greenLabel.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        blueLabel.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        
        redTextField.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        greenTextField.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        blueTextField.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        
        redSlider.tintColor = .systemRed
        greenSlider.tintColor = .systemGreen
        blueSlider.tintColor = .systemBlue
        
    }
    
    @IBAction func redSliderAction() {
        redLabel.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        redTextField.text = colorValueToText(colorValue: CGFloat(redSlider.value))
        smallScreen.backgroundColor = setScreenColor(of: redSlider, greenSlider, blueSlider)
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        greenTextField.text = colorValueToText(colorValue: CGFloat(greenSlider.value))
        smallScreen.backgroundColor = setScreenColor(of: redSlider, greenSlider, blueSlider)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        blueTextField.text = colorValueToText(colorValue: CGFloat(blueSlider.value))
        smallScreen.backgroundColor = setScreenColor(of: redSlider, greenSlider, blueSlider)
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        let bigScreenColor = setScreenColor(of: redSlider, greenSlider, blueSlider)
        delegate.setScreenColor(for: bigScreenColor)
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonAction() {
        view.endEditing(true)
    }

}


private extension SettingsViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return showAlert(with: "Oops!", and: "Invalid number")}
        guard floatValue <= 1.00 && floatValue >= 0 else { return showAlert(with: "Oops!", and: "Invalid number") }
        
        if textField == redTextField {
            redSlider.value = floatValue
            redSliderAction()
            
        } else if textField == greenTextField {
            greenSlider.value = floatValue
            greenSliderAction()
            
        } else {
            blueSlider.value = floatValue
            blueSliderAction()
            
        }
    
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if redTextField.isEditing {
            view.endEditing(true)
        } else if greenTextField.isEditing {
            view.endEditing(true)
        } else {
            view.endEditing(true)
        }
        return true
    }
}


extension UIColor {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? (r,g,b,a) : nil
    }
}



