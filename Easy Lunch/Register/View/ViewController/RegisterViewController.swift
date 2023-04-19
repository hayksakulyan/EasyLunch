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
    
    var colors = ColorsForGradients()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configUI()
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
    }
    
  
    
    
    
    @IBAction func haveAccountSignInAction(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    let image1 = UIImage(systemName: "eye.slash")
    let image2 = UIImage(systemName: "eye")
    
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


