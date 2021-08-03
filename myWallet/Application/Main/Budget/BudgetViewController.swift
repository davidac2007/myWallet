//
//  BudgetViewController.swift
//  myWallet
//
//  Created by David Avendaño on 03/08/21.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
              tableView.register(cell, forCellReuseIdentifier: "cell")
    }
    

    
}

extension BudgetViewController: UITableViewDelegate{
    
}

extension BudgetViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
