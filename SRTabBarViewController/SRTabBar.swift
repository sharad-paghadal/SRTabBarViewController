//
//  SRTabBar.swift
//  SRTabBarViewController
//
//  Created by Sharad Paghadal on 17/11/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

protocol SRTabBarDelegate {
    func SRTabBarDelegate(didSelectedButtonAt index: Int, with direction: UIPageViewControllerNavigationDirection)
}

class SRTabBar: UIView {
    
    var titleForViewController: Array<String> = Array<String>()
    var indicator = UIView()
    var stackView = UIStackView()
    var delegate: SRTabBarDelegate?
    var selectedIndex = Constant.initialPage
    var arrayButtonTitle = [UIButton]()
    
    init(frame: CGRect, title: [String]) {
        super.init(frame: frame)
        
        self.titleForViewController = title
        self.autoresizingMask = [.flexibleWidth]
        self.backgroundColor = UIColor.yellow
        
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        stackView.autoresizingMask = [.flexibleWidth]
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = true
        for title in titleForViewController {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            stackView.addArrangedSubview(button)
            button.tag = titleForViewController.index(of: title)!
            button.addTarget(self, action: #selector(selectedButton(_:)), for: UIControlEvents.touchUpInside)
            arrayButtonTitle.append(button)
        }
        addSubview(stackView)
        
        indicator = UIView(frame: CGRect(x: 0, y: frame.size.height - 5, width: frame.size.width / CGFloat(titleForViewController.count), height: 5))
        indicator.backgroundColor = UIColor.blue
        addSubview(indicator)
        
        changeButtonTitleColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = [.flexibleWidth]
        self.backgroundColor = UIColor.yellow
        
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        stackView.autoresizingMask = [.flexibleWidth]
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = true
        for title in titleForViewController {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            stackView.addArrangedSubview(button)
            button.tag = titleForViewController.index(of: title)!
            button.addTarget(self, action: #selector(selectedButton(_:)), for: UIControlEvents.touchUpInside)
        }
        addSubview(stackView)
        
        /// adding indicator for making selection
        indicator = UIView(frame: CGRect(x: 0, y: frame.size.height - 5, width: frame.size.width / CGFloat(titleForViewController.count), height: 5))
        indicator.backgroundColor = UIColor.blue
        addSubview(indicator)
    }
    
    @objc func selectedButton(_ sender: UIButton) {
        if selectedIndex < sender.tag {
            delegate?.SRTabBarDelegate(didSelectedButtonAt: sender.tag, with: .forward)
        }else if selectedIndex > sender.tag {
            delegate?.SRTabBarDelegate(didSelectedButtonAt: sender.tag, with: .reverse)
        }
        animateIndicator(To: sender.tag)
    }
    
    func animateIndicator(To index: Int) {
        UIWindow.animate(withDuration: 0.2) {
            self.indicator.frame.origin.x = self.indicator.frame.size.width * CGFloat(index)
        }
        selectedIndex = index
        changeButtonTitleColor()
    }
    
    func changeButtonTitleColor() {
        for i in 0 ..< titleForViewController.count {
            let button = arrayButtonTitle[i]
            if i == selectedIndex {
                button.setTitleColor(UIColor.brown, for: .normal)
            }else {
                button.setTitleColor(UIColor.blue, for: .normal)
            }
        }
    }
}
