//
//  MenuViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 17.05.23.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var menuTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        registerCells()
    }
    
    private func configUI() {
        menuTableview.delegate = self
        menuTableview.dataSource = self
    }
    
    private func registerCells() {
        let myXib = UINib(nibName: "TableViewCell", bundle: .main)
        menuTableview.register(myXib, forCellReuseIdentifier: "TableViewCell")
    }


   
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            headerView.backgroundColor = UIColor.lightGray

            let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 15, height: 30))
            label.text = "Section \(section + 1)"
            label.textColor = UIColor.black
            headerView.addSubview(label)

            return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect.zero)
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
