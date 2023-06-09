//
//  LoginViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 12.04.23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var haventAccountSignUp: UIButton!
    @IBOutlet weak var checkboxBTN: UIButton!
    @IBOutlet weak var rmemberMe: UILabel!
    @IBOutlet weak var forgotPassword: UILabel!
    @IBOutlet weak var signInBTN: UIButton!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var wrongUsernameLBL: UILabel!
    @IBOutlet weak var passwordEye: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var wrongPasswordLBL: UILabel!
    
    var checkboxChecked: Bool = false
    var checked = UIImage(systemName: "checkmark")
    var greenColor = UIColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
    var colors = ColorsForGradients()
    var wrongUserName = "Email is incorrect"
    let image1 = UIImage(systemName: "eye.slash")
    let image2 = UIImage(systemName: "eye")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUi()
        setDelegates ()
    }
    
    func configUi() {
        usernameTF.placeHolderColor = .white
        passwordTF.placeHolderColor = .white
      
        signInBTN.layer.cornerRadius = self.signInBTN.layer.frame.height / 4
        signInBTN.setTitleColor(UIColor.white, for: .normal)
        let _ = self.signInBTN.applyGradient(colours: [colors.btnGradientColor[0], colors.btnGradientColor[1], colors.btnGradientColor[2]], locations: [0.0, 0.5, 1.0])
        signInBTN.clipsToBounds = true
        blackView.layer.cornerRadius = self.signInBTN.layer.frame.height / 4
        checkboxBTN.layer.borderWidth = 2
        checkboxBTN.layer.borderColor = CGColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
        //MARK: only for black background view
        blackView.backgroundColor = .gray.withAlphaComponent(0.55)
        let _ = shadow.applyGradient(colours: [UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0), UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0.5)], locations: [0, 1])
        passwordTF.isSecureTextEntry = true
        haventAccountSignUp.tintColor = greenColor
        usernameTF.tintColor = greenColor
        passwordTF.tintColor = greenColor
    }
    
    func setDelegates () {
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    func moveToSignUp() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Register", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    @IBAction func haventAccountSignUpAction(_ sender: UIButton) {
        moveToSignUp()
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        guard let email = usernameTF.text else {return}
        guard let password = passwordTF.text else {return}
        logIn(email: email, password: password)
    }
    
    func moveToMainPage() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "MainPage", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    func logIn(email: String, password: String) {
        FirebaseStorageManager.shared.loginUser(email: email, password: password) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let userData):
                if email == userData?.user.email {
                    moveToMainPage()
                } else {
                    wrongUsernameLBL.text = wrongUserName
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func passwordEyeAction(_ sender: UIButton) {
        if passwordTF.isSecureTextEntry == false {
            passwordTF.isSecureTextEntry = true
            passwordEye.setImage(image1, for: .normal)
        } else {
            passwordTF.isSecureTextEntry = false
            passwordEye.setImage(image2, for: .normal)
        }
    }
    
    @IBAction func checkboxBTNAction(_ sender: UIButton) {
        if checkboxChecked == false {
            checkboxBTN.setImage(checked, for: .normal)
            checkboxBTN.tintColor = .white
            checkboxChecked = true
        } else {
            checkboxBTN.setImage(nil, for: .normal)
            checkboxChecked = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
                textField.resignFirstResponder()
                passwordTF.becomeFirstResponder()
           } else {
               passwordTF.resignFirstResponder()
           }
        return true
    }
}
