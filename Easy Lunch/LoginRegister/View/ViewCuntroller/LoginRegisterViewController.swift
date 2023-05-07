//
//  LoginRegisterViewController.swift
//  Easy Lunch
//
//  Created by Hayk Sakulyan on 01.04.23.
//

import UIKit

class LoginRegisterViewController: UIViewController {
    
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var blackView: UIImageView!
    
    var colors = ColorsForGradients()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configUI()
    }
    
    func configUI() {
        
        signIn.layer.cornerRadius = self.signIn.layer.frame.height / 4
        signUp.layer.cornerRadius = self.signUp.layer.frame.height / 4
        
        signIn.setTitleColor(UIColor.white, for: .normal)
        signUp.setTitleColor(UIColor.white, for: .normal)
        
        let _ = self.signIn.applyGradient(colours: [colors.btnGradientColor[0], colors.btnGradientColor[1], colors.btnGradientColor[2]], locations: [0.0, 0.5, 1.0])
        signIn.clipsToBounds = true
        signUp.layer.borderWidth = 1.5
        signUp.layer.borderColor = CGColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
        
        let _ = blackView.applyGradient(colours: [UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0), UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0.5)], locations: [0, 1])
        
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
        print("Hello SignIn")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        print("Hello SignUp")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Register", bundle: nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}




