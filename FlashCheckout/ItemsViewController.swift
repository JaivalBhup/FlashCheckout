//
//  ItemsViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-24.
//

import UIKit

class ItemsViewController: UIViewController {
    var store:Store?
    var items:[Item] = [
        Item(name: "Lays", price: 4.3),
        Item(name: "2% Skim Milk", price: 4.9),
        Item(name: "Ranch Dressing", price: 2.4),
        Item(name: "Whole Wheat Bread", price: 1.64),
        Item(name: "Onions 2kg", price: 2.4),
        Item(name: "Orange Juice 2L", price: 3.6)
    ]
    @IBOutlet weak var scanButt: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkoutButt: UIButton!
    var total:Double = 0
    init?(coder: NSCoder, For Store: Store) {
        self.store = Store
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        title = self.store?.name ?? ""
        tableView.delegate = self
        tableView.dataSource = self
        let currentSystemScheme = UITraitCollection.current.userInterfaceStyle
        if currentSystemScheme == .dark{
            scanButt.layer.shadowColor = UIColor.white.cgColor
            checkoutButt.layer.shadowColor = UIColor.white.cgColor
        }
        else{
            scanButt.layer.shadowColor = UIColor.black.cgColor
            checkoutButt.layer.shadowColor = UIColor.black.cgColor
        }
        scanButt.layer.shadowOffset = CGSize(width: 5, height: 5)
        scanButt.layer.shadowRadius = 5
        scanButt.layer.shadowOpacity = 0.65
        checkoutButt.layer.shadowOffset = CGSize(width: 5, height: 5)
        checkoutButt.layer.shadowRadius = 5
        checkoutButt.layer.shadowOpacity = 0.65
        // Do any additional setup after loading the view.
    }
    func loadItems(){
        getTotal()
    }
    func getTotal(){
        self.tabBarItem.badgeValue = "\(items.count)"
        var n:Double = 0
        for i in items{
            n += i.price
        }
        self.total = n
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
extension ItemsViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item")!
        if indexPath.row < items.count{
            cell.imageView?.image = UIImage(named: "grocery")
            cell.textLabel?.text = items[indexPath.row].name
            cell.detailTextLabel?.text = "$\(items[indexPath.row].price)"
        }
        else{
            cell.textLabel?.text = "\(items.count) items"
            cell.detailTextLabel?.text = "Total $\(Double(round(1000*total)/1000))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "goToItemDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
