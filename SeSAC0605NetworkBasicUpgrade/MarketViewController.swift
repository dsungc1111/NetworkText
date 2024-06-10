//
//  MarketViewController.swift
//  SeSAC0605NetworkBasicUpgrade
//
//  Created by 최대성 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit


struct Market: Decodable {
    let market: String
    let korean_name: String
    let english_name: String
}



class MarketViewController: UIViewController {
  
    let tableView = UITableView()
    
    var list: [Market] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        print(#function, "111111")
        callRequest()
        print(#function, "222222")
    }
    
    
    
    
    func configureTableView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.backgroundColor = .orange
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)

    }
    
    
    
    func callRequest() {
        print(#function, "33333")
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let value):
                self.list = value
                // ⭐️⭐️⭐️⭐️
                self.tableView.reloadData()
                // ⭐️⭐️⭐️⭐️
                print("success")
            case .failure(let error):
                print(error)
            }
        }
        
        
        print(#function, "44444")
        
    }


}


extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as! MarketTableViewCell
        
        
        cell.nameLabel.text = list[indexPath.row].korean_name
        
        return cell
    }
    
    
}
