//
//  EmploeeViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 12.05.23.
//

import UIKit

class EmploeeViewController: UIViewController {

    let emploeeViewModel = EmploeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emploeeViewModel.getEmploeeList()
    }
    

}
