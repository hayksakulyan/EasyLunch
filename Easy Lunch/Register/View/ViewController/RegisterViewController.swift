//
//  RegisterViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 07.04.23.
//

import UIKit

class RegisterViewController: UIViewController {
     
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var wrongUsername: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var wrongEmail: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var wrongPassword: UILabel!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var wrongConfirm: UILabel!
    @IBOutlet weak var signInBTN: UIButton!
    
    @IBOutlet weak var checkboxBTN: UIButton!
    @IBOutlet weak var user: UIImageView!
    
    @IBOutlet weak var haveAccountSignIn: UIButton!
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var passwordEye: UIButton!
    @IBOutlet weak var confirmPasswordEye: UIButton!
    
    
    
    var checkboxChecked: Bool = false
    var checked = UIImage(systemName: "checkmark")
    var greenColor = UIColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
    let image1 = UIImage(systemName: "eye.slash")
    let image2 = UIImage(systemName: "eye")
    var colors = ColorsForGradients()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configUI()
        TFdelegates()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            self.blackView.frame.origin.y -= 60
//        }
//    }
//    @objc func keyboardWillHide(_ notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            self.blackView.frame.origin.y += 60
//        }
//    }
    
    func TFdelegates() {
        usernameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        confirmPasswordTF.delegate = self
    }
    
    func configUI() {
        usernameTF.placeHolderColor = .white
        emailTF.placeHolderColor = .white
        passwordTF.placeHolderColor = .white
        confirmPasswordTF.placeHolderColor = .white
        
        signInBTN.layer.cornerRadius = self.signInBTN.layer.frame.height / 4
        signInBTN.setTitleColor(UIColor.white, for: .normal)
        let _ = self.signInBTN.applyGradient(colours: [colors.btnGradientColor[0], colors.btnGradientColor[1], colors.btnGradientColor[2]], locations: [0.0, 0.5, 1.0])
        signInBTN.clipsToBounds = true
        blackView.layer.cornerRadius = self.signInBTN.layer.frame.height / 4
        checkboxBTN.layer.borderWidth = 2
        checkboxBTN.layer.borderColor = CGColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
        // senc enk anum vor chxangari mnacac elementneri guynerin
        blackView.backgroundColor = .gray.withAlphaComponent(0.55)
        let _ = shadow.applyGradient(colours: [UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0), UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0.5)], locations: [0, 1])
        passwordTF.isSecureTextEntry = true
        confirmPasswordTF.isSecureTextEntry = true
        
        haveAccountSignIn.tintColor = greenColor
        usernameTF.tintColor = greenColor
        emailTF.tintColor = greenColor
        confirmPasswordTF.tintColor = greenColor
        passwordTF.tintColor = greenColor
    }
 
    @IBAction func haveAccountSignInAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    @IBAction func eyeAction(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            if passwordTF.isSecureTextEntry == true {
                passwordTF.isSecureTextEntry = false
                passwordEye.setImage(image2, for: .normal)
            } else {
                passwordTF.isSecureTextEntry = true
                passwordEye.setImage(image1, for: .normal)
            }
        case 2:
            if confirmPasswordTF.isSecureTextEntry == true {
                confirmPasswordTF.isSecureTextEntry = false
                confirmPasswordEye.setImage(image2, for: .normal)
            } else {
                confirmPasswordTF.isSecureTextEntry = true
                confirmPasswordEye.setImage(image1, for: .normal)
            }
        default:
            break
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
    
    @IBAction func signUpBTNAction(_ sender: UIButton) {
        print("signUP button action")
        guard let username = usernameTF.text else {return}
        guard let email = emailTF.text else {return}
        guard let password = passwordTF.text else {return}
        guard let confirmPassword = confirmPasswordTF.text else {return}
        registerUser(suername: username, email: email, password: password, confirmPassword: confirmPassword)
//        sender.isUserInteractionEnabled = false
    }
    
    
    func onboardingPageStoryboard(uid: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        nextViewController.uid = uid
    }
    
    func registerUser(suername: String, email: String, password: String, confirmPassword: String) {
        if !email.isValidEmail() {
            wrongEmail.text = "Email is incorrect"
        } else if email.isEmpty {
            wrongEmail.text = "Email field can't be empty"
        } else if password != confirmPassword {
            wrongConfirm.text = "Password confirmation error"
        }
        else {
            FirebaseStorageManager.shared.registerUser(email: email, password: password) {[weak self] result in
                
                switch result {
                case .success(let authData):
                    
                    guard let self = self else {return}
                    
                    //TODO: Need to add app onboarding here
                    
                    if let userID = authData?.user.uid {
                        self.onboardingPageStoryboard(uid: userID)
                        
                        
//                        FirebaseStorageManager.shared.writeUserData(firstname: "Hayk", lastName: "Sakulyan", userID: userID)
                    }
                    
                    print("Registration is success")
                    
                case .failure(let error):
                    guard let self = self else {return}
                    AlertManager.showRegistrationErrorAlert(on: self, with: error)
                    print(error.localizedDescription)
                }
            }
        }
        
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
//TODO: need to add keyboard will show will hide  functionality
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // toxum em edit anel
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // sksvela editingy
        wrongEmail.text = ""

    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // verjacela editingy
        
//        print("Karelia edit anel ?")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField){

    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hertov cursory mtnuma verjum helnum
        if textField == usernameTF {
               textField.resignFirstResponder()
               emailTF.becomeFirstResponder()
           } else if textField == emailTF {
               textField.resignFirstResponder()
               passwordTF.becomeFirstResponder()
           } else if textField == passwordTF {
               textField.resignFirstResponder()
               confirmPasswordTF.becomeFirstResponder()
           } else {
               confirmPasswordTF.resignFirstResponder()
           }
        return true
    }
    
//    func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
//
//    }
//
//    func textField(_ textField: UITextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating) {
//
//    }
//
//    func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
//
//    }
    
}
