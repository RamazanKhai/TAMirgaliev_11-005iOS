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
    
    //MARK: - Labels
    
    @IBOutlet weak var attantionLabel: UILabel!
    
    //MARK: - Buttons no action
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var deleteYesButton: UIButton!
    
    //MARK: - Views
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    //MARK: - Buttons with action
    
    @IBAction func didClickDeleteAccauntButton(_ sender: Any) {
        // удалить из userdefaults
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickYesButton(_ sender: Any){
        
                dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickNoButton(_ sender: Any) {
        mainView.backgroundColor = .white
        attantionLabel.isHidden = true
        yesButton.isHidden = true
        noButton.isHidden = true
        backgroundView.isHidden = true
    }
    
    @IBAction func exitFromAccauntButton(_ sender: Any) {
        mainView.backgroundColor = UIColor.gray
        backgroundView.layer.cornerRadius = 30
        attantionLabel.text = "Вы действительно хотите выйти из учетной записи?"
        backgroundView.isHidden = false
        attantionLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false

    }
    
    @IBAction func deleteAccauntButton(_ sender: Any) {
        mainView.backgroundColor = UIColor.gray
        backgroundView.layer.cornerRadius = 30
        attantionLabel.text = "Вы действительно хотите удалить учетную запись?"
        backgroundView.isHidden = false
        attantionLabel.isHidden = false
        deleteYesButton.isHidden = false
        noButton.isHidden = false
        print("TEEEE")
        if yesButton.isTouchInside {
            print("TEST")
        }
    }
}
