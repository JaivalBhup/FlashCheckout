//
//  StoresViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-24.
//

import UIKit

class StoresViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var stores:[Store] = [
        Store(name: "Walmart", ID: "1", ratings: 5, imageName: "wallmart"),
        Store(name: "Canadian Tire", ID: "2", ratings: 5, imageName: "canadiantire"),
        Store(name: "Costco", ID: "3", ratings: 5, imageName: "costco"),
        Store(name: "Dollarama", ID: "4", ratings: 5, imageName: "dollorama"),
        Store(name: "Food Basics", ID: "5", ratings: 5, imageName: "foodbasics"),
        Store(name: "No Frills", ID: "6", ratings: 5, imageName: "nofrills"),
        Store(name: "Whole Foods", ID: "7",ratings: 5, imageName: "wholefoods"),
    ]
    var selectedStore:Store? = nil
    @IBSegueAction private func goToHome(_ coder: NSCoder) -> ItemsViewController? {
        if let destination = ItemsViewController(coder: coder, For: self.selectedStore!){
            //destination.store = self.selectedStore
            return destination
        }
        return nil
    }
//    @IBSegueAction private func goToCart(_ coder: NSCoder) -> LatestOrders? {
//        if let destination = LatestOrders(coder: coder, For: self.selectedStore!){
//            //destination.store = self.selectedStore
//            return destination
//        }
//        return nil
//    }
    override func viewDidLoad() {
        print("fkdsl")
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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

extension StoresViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0{
//
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "store")! as! StoreCell
        let s = stores[indexPath.row]
        cell.MainImg.image = UIImage(named: s.imageName)
        cell.TopLab.text = s.name
        cell.BottomLab.text = "Ratings \(s.ratings)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedStore = stores[indexPath.row]
        performSegue(withIdentifier: "goToStore", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! tabContViewController
        if let ss = selectedStore{
            destination.store = ss
        }
    }
    
    
}
