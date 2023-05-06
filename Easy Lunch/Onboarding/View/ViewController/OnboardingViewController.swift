//
//  OnboardingViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 02.05.23.
//

import UIKit



class OnboardingViewController: UIViewController {
    
   
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var wrongLastNameLbl: UILabel!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var wrongLastnameLbl: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var finishBtn: UIButton!
    
    var greenColor = UIColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
    
    var colors = ColorsForGradients()
    
    var uid: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUi()
    }
    func configUi() {
       
        firstNameTF.placeHolderColor = .white
        lastNameTF.placeHolderColor = .white
      
        
        finishBtn.layer.cornerRadius = self.finishBtn.layer.frame.height / 4
        finishBtn.setTitleColor(UIColor.white, for: .normal)
        let _ = self.finishBtn.applyGradient(colours: [colors.btnGradientColor[0], colors.btnGradientColor[1], colors.btnGradientColor[2]], locations: [0.0, 0.5, 1.0])
        finishBtn.clipsToBounds = true
        blackView.layer.cornerRadius = self.finishBtn.layer.frame.height / 4
        
        //MARK: only for black background view
        blackView.backgroundColor = .gray.withAlphaComponent(0.55)
//        let _ = shadow.applyGradient(colours: [UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0), UIColor(red: (0/255.0), green: (0/255.0), blue:(0/255.0), alpha: 0.5)], locations: [0, 1])
        
        firstNameTF.tintColor = greenColor
        lastNameTF.tintColor = greenColor
    }
   
    
    
    @IBAction func finishBtnAction(_ sender: UIButton) {
//        print(uid!)
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}



