//
//  OnBoardingViewController.swift
//  myWallet
//
//  Created by David Avendaño on 22/07/21.
//

import UIKit

struct OnBoardingItem{
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
     var pageControl: UIPageControl?
        
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Save money and reduce debt",
                description: "Press the start button",
                imageName: "OnBoarding1"
            ),
            OnBoardingItem(
                title: "You've finished your onBoarding",
                description: "Press the start button",
                imageName: "OnBoarding2"
            )
        ]
    } ()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
         var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instantViewController(i))
        }
        return items
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func instantViewController(_ index: Int) -> UIViewController {
        guard let viewController = (UIStoryboard(name: "OnBoarding", bundle: Bundle.main )).instantiateViewController(identifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            return UIViewController()
        }
        viewController.item = items[index]
        return viewController
 }
   
}

extension OnBoardingViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    
}

extension OnBoardingViewController: UIPageViewControllerDelegate{
    
}
