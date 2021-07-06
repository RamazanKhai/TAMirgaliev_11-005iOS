//
//  CheckInController.swift
//  ProjectTimFich
//
//  Created by Тимур Миргалиев on 04.07.2021.
//

import UIKit

struct Person {
    var login: String
    var name: String
    var surName: String
    var email: String
    var password: String
}

class CheckInViewController: UIViewController {
    
    public static var dataSourceAccaunts: [Person] = []
    
    func getDataSource() -> [Person] {
        return CheckInViewController.dataSourceAccaunts
    }
    
    // MARK: - TextFields
    
    @IBOutlet weak var loginOfAccaunt: UITextField!
    @IBOutlet weak var surnameAccaunt: UITextField!
    @IBOutlet weak var nameAccaunt: UITextField!
    @IBOutlet weak var emailAccaunt: UITextField!
    @IBOutlet weak var passwordAccaunt: UITextField!
    @IBOutlet weak var reapetPasswordAccunt: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
    // MARK: - Labels
    
    @IBOutlet weak var notificationLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
                // кнопка перехода на предидущий экран
            self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(CheckInViewController.back(sender:)))
            self.navigationItem.leftBarButtonItem = newBackButton
        }

    @objc func back(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
            _ = navigationController?.popViewController(animated: true)
        }
    
    // MARK: - Buttons
    
    @IBAction func didClickSaveProfileButton(_ sender: Any) {
         // Нужно сделать проверку на то не было ли такого же email до этого
        if let emailAccountText = emailAccaunt.text?.lowercased(),
           emailAccountText.contains("@"), passwordAccaunt.text == reapetPasswordAccunt.text {
            
            CheckInViewController.dataSourceAccaunts.append(Person(login: loginOfAccaunt.text!, name: nameAccaunt.text!, surName: surnameAccaunt.text!, email: emailAccaunt.text!, password: passwordAccaunt.text!))
            notificationLabel.text = "Your Profile succesfully added"
            notificationLabel.isHidden = false
            print(CheckInViewController.dataSourceAccaunts.count)
        } else {
            notificationLabel.text = "Somthing go wrong, check what you write!"
            notificationLabel.isHidden = false
        }
    }
    
    // MARK: - скрытие и появление пароля для двух полей
    
    var countOfTaping: Int = 0
    @IBAction func didClickPasswordShowButton(_ sender: Any) {
        if countOfTaping % 2 == 0 /*&& passwordAccaunt.text != "" */ {
            passwordAccaunt.isSecureTextEntry = false
            countOfTaping += 1
        } else /*if passwordAccaunt.text != nil */{
            passwordAccaunt.isSecureTextEntry = true
            countOfTaping += 1
        }
    }
    
    var ReapetCountOfTaping: Int = 0
    @IBAction func didClickReapeatPasswordShowButton(_ sender: Any) {
        if ReapetCountOfTaping % 2 == 0 /* && passwordAccaunt.text != "" */{
            reapetPasswordAccunt.isSecureTextEntry = false
            
            ReapetCountOfTaping += 1
        } else /* if passwordAccaunt.text != nil */{
            reapetPasswordAccunt.isSecureTextEntry = true
            ReapetCountOfTaping += 1
        }
    }
}
