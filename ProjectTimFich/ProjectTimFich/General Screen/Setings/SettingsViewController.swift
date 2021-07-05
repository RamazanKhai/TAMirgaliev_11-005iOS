//
//  SettingsViewController.swift
//  ProjectTimFich
//
//  Created by Тимур Миргалиев on 05.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Buttons
    
    @IBAction func exitFromAccauntButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteAccauntButton(_ sender: Any) {
        //удалить из userDefault и попать на экран(логин пароль)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exitFromAppButton(_ sender: Any) {
        
    }
}
