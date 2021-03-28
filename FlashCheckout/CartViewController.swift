//
//  CartViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-25.
//

import UIKit

class LatestOrders: UIViewController {

    var store:Store?
    var total:Double = 0
    @IBOutlet weak var totalItems: UILabel!
    @IBOutlet weak var payButt: UIButton!
    var cartItems:[Item] = [
        Item(name: "Book", price: 30),
        Item(name: "Cloths", price: 40),
        Item(name: "Pencils", price: 59),
        Item(name: "Food", price: 10)
    ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //tableView.register(TotalBillTableViewCell.self, forCellReuseIdentifier: "totalCell")
        tableView.register(UINib(nibName: "TotalBillTableViewCell", bundle: nil), forCellReuseIdentifier: "totalCell")
        payButt.layer.shadowColor = UIColor.black.cgColor
        payButt.layer.shadowOffset = CGSize(width: 5, height: 5)
        payButt.layer.shadowRadius = 5
        payButt.layer.shadowOpacity = 0.65
        loadCart()
    }
    
    init?(coder: NSCoder, For Store: Store) {
        self.store = Store
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadCart(){
        self.totalItems.text = "\(cartItems.count) items"
        if cartItems.count == 0{
            self.tableView.isHidden = true
            return
        }
        self.tabBarItem.badgeValue = "\(cartItems.count)"
        getTotal()
    }
    func getTotal(){
        var n = 0.0
        for i in cartItems{
            n = n + i.price
        }
        self.total = n
        tableView.reloadData()
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
extension LatestOrders:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < cartItems.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem")!
            cell.textLabel?.text = cartItems[indexPath.row].name
            cell.detailTextLabel?.text = "$\(cartItems[indexPath.row].price)"
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem")!
            let boldAttribute = [
                  NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
               ]
            let boldText1 = NSAttributedString(string: "Total", attributes: boldAttribute)
            let boldText2 = NSAttributedString(string: "$\(self.total)", attributes: boldAttribute)
            cell.detailTextLabel?.text = boldText1.string
            cell.detailTextLabel?.text = boldText2.string
            return cell
        }
        
    }
    
    
}
