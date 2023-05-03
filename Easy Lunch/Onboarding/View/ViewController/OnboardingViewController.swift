//
//  OnboardingViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 02.05.23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextBtnAction(_ sender: UIButton) {
        
    }
    

}
