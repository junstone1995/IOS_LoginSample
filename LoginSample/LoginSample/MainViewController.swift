//
//  MainViewController.swift
//  LoginSample
//
//  Created by Junseok Lee on 2021/09/08.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
            환영합니다.
            \(email)님
            """
        
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPasswordButton.isHidden = !isEmailSignIn
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
}
