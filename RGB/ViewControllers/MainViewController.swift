//
//  ColorViewController.swift
//  RGB
//
//  Created by kukushkin-ds on 01.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setScreenColor(for bigScreenColor: UIColor)
}

class MainViewController: UIViewController {

    var bigScreenColor: UIColor!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.smallScreenColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setScreenColor(for bigScreenColor: UIColor) {
        view.backgroundColor = bigScreenColor
    }
}
