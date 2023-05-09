//
//  ViewController.swift
//  Easy Lunch
//
//  Created by Hayk Sakulyan on 26.03.23.

import Foundation
import UIKit


class SplashViewController: UIViewController {
    

    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var viewBack: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configUI()
        
        navigateFromSplash()
        
    }
    
    
    // MARK: splashum imageviewn stexcvuma codeovkkk
    func configUI() {
        let imageView: UIImageView = {
            let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 185))
            logoImageView.image = UIImage(named: "Logo")
            return logoImageView
        }()
        view.addSubview(imageView)
        imageView.center = self.firstView.center
        
        let _ = self.viewBack.applyGradient(colours: [UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0), UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0.5)], locations: [0, 1])
    }
    
    //TODO: for example, this metod called only 1 time
//    override func loadView() {
//        super.loadView()
//        UIApplication.shared.statusBarStyle = .lightContent
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func navigateFromSplash() {
        // TODO: need to change second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){

            let storyBoard: UIStoryboard = UIStoryboard(name: "LoginRegister", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginRegisterViewController") as! LoginRegisterViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
            
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//            nextViewController.modalPresentationStyle = .fullScreen
//            self.present(nextViewController, animated: true, completion: nil)
            
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
//            nextViewController.modalPresentationStyle = .fullScreen
//            self.present(nextViewController, animated: true, completion: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}




