//
//  SRTabBarViewController.swift
//  SRTabBarViewController
//
//  Created by Sharad Paghadal on 17/11/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class SRTabBarViewController: UIView, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate{

    var pages = [UIViewController]()
    let pageControl = UIPageControl(frame: CGRect(x: 10, y: 10, width: 100, height: 10))
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let initialPage = 0
        
        let page1 = ViewController()
        page1.view.backgroundColor = UIColor.red
        let page2 = ViewController()
        page2.view.backgroundColor = UIColor.green
        
        self.pages.append(page1)
        self.pages.append(page2)
        
        pageViewController.setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        pageViewController.view.frame = self.frame
        
        addSubview(pageViewController.view)
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        addSubview(pageControl);
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard pages.count > previousIndex else {
            return nil
        }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = pages.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = pages.index(of: (pageViewController.viewControllers?.first)!)!
        }
    }
}
