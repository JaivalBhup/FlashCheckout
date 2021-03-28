//
//  tabContViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-24.
//

import UIKit

class tabContViewController: UITabBarController {
    var store:Store?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = store?.name ?? ""
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
    @IBAction func Exit(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Leaving the store early?", message: "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let action2 = UIAlertAction(title: "No", style: .destructive, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
