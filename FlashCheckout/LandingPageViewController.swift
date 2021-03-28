//
//  LandingPageViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-27.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var scanStoreButt: UIButton!
    @IBOutlet weak var selctStoreButt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentSystemScheme = UITraitCollection.current.userInterfaceStyle
        if currentSystemScheme == .dark{
            scanStoreButt.layer.shadowColor = UIColor.white.cgColor
            selctStoreButt.layer.shadowColor = UIColor.white.cgColor
        }
        else{
            scanStoreButt.layer.shadowColor = UIColor.black.cgColor
            selctStoreButt.layer.shadowColor = UIColor.black.cgColor
        }
        
        scanStoreButt.layer.shadowOffset = CGSize(width: 5, height: 5)
        scanStoreButt.layer.shadowRadius = 5
        scanStoreButt.layer.shadowOpacity = 0.65
        
        selctStoreButt.layer.shadowOffset = CGSize(width: 5, height: 5)
        selctStoreButt.layer.shadowRadius = 5
        selctStoreButt.layer.shadowOpacity = 0.65
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
