# SRTabBarViewController
- Android like custom tab bar.
----------
# How To Use:
- Just add UIView on storyboard and assign class `SRTabBarViewController`.
- Make configuration according to your requirements.

``` swift
    /// Indicator color
    var indicatorColor: UIColor = UIColor.blue
    
    /// Tab bar button color
    var buttonTitleFontColor: UIColor = UIColor.blue
    
    /// Tab bar selected button color
    var buttonTitleSelectedFontColor: UIColor = UIColor.brown
    
    /// Tab bar background color
    var tabBarBackgroundColor: UIColor = UIColor.yellow
    
    /// Indicator height
    var indicatorHeight: CGFloat = 5
```
----------
- Make `@IBOutlet` of view and assign properties
``` swift
@IBOutlet weak var MyView: SRTabBarViewController! {
    didSet {
        // write configuration code here...
        let page1 = ViewController()
        page1.view.backgroundColor = UIColor.red
        let page2 = ViewController()
        page2.view.backgroundColor = UIColor.green
        let page3 = ViewController()
        page3.view.backgroundColor = UIColor.brown    
        MyView.pages = [page1, page2, page3]
        MyView.titleForViewController = ["Red", "Green","Brown"]
    }
}
```
