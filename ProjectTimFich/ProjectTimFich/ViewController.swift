//
//  ViewController.swift
//  ProjectTimFich
//
//  Created by Тимур Миргалиев on 03.07.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - TextFields
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() { // срабатывает один раз за жизненный цикл нашего контрллера
        super.viewDidLoad()
    }
    
    //MARK: - Buttons
    
    @IBAction func checkInButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let check = CheckInController()
        var persons: [Any] = check.getDataSource()
        print(persons.count)
        for person in persons {
         }
    }
    
}
