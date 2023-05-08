//
//  MainPageViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 28.04.23.
//

import UIKit
import Firebase
import FirebaseAuth

class MainPageViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserData()
    }
    
    
    func getUserData() {
        FirebaseStorageManager.shared.readUserData { result in
            let userID = Auth.auth().currentUser?.uid
            switch result {
            case .success(let userData):
                self.firstName.text = userData.firstName
                self.lastName.text = userData.lastName
            case .failure(.userNotFound):
                print("")
            }
        }
    }

}
