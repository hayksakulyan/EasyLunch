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
    @IBOutlet weak var wrongFirstNameLbl: UILabel!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var wrongLastnameLbl: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var finishBtn: UIButton!
    
    var greenColor = UIColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1)
    
    var colors = ColorsForGradients()
    let wrongUsername = "Firstname can't be empty"
    let wrongLastname = "Lastname can't be empty"
    var uid: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUi()
        setDelegates()
        
    }
    
    func setDelegates() {
        firstNameTF.delegate = self
        lastNameTF.delegate = self
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
   
    func writeData() {
        guard let uid = uid else {return}
        guard let firstname = firstNameTF.text else {return}
        guard let lastname = lastNameTF.text else {return}
    
        
        if firstname.isEmpty {
            wrongFirstNameLbl.text = wrongUsername
        } else if lastname.isEmpty {
            wrongLastnameLbl.text = wrongLastname
        } else {
            FirebaseStorageManager.shared.writeUserData(firstname: firstname, lastName: lastname, userID: uid)
        }
        
    }
    func mainPageStoryboard() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "MainPage", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func finishBtnAction(_ sender: UIButton) {
        writeData()
        mainPageStoryboard()
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension OnboardingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTF {
            textField.becomeFirstResponder()
        } 
 
        return true
    }
}


