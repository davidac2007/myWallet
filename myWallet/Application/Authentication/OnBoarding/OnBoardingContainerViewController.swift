//
//  OnBoardingContainerViewController.swift
//  myWallet
//
//  Created by David Avendaño on 21/07/21.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        destination.pageControl = pageControl
    }
    
    
}
