//
//  DataOfAccauntViewController.swift
//  ProjectTimFich
//
//  Created by Тимур Миргалиев on 06.07.2021.
//

import UIKit

class DataOfAccauntViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var lineUnderTextField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Buttons
    
    @IBAction func didClickEditButton(_ sender: Any) {
        repeatPasswordLabel.isHidden = false
        repeatPasswordTextField.isHidden = false
        lineUnderTextField.isHidden = false
    }
}
