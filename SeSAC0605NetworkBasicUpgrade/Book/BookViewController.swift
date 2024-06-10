//
//  BookViewController.swift
//  SeSAC0605NetworkBasicUpgrade
//
//  Created by 최대성 on 6/10/24.
//

import UIKit
import Alamofire


class BookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureView()
        callRequest()
    }
    
    
    func configureView() {
        print(#function)
        view.backgroundColor = .orange
    }
    
    func callRequest() {
        /*
         1. url
         2. query string
         3. request
         4. response (ex. responseString로 체크 responseDecodable로 보통 ㄱ)
         */
        print(#function)
        let url = "https://openapi.naver.com/v1/search/book.json?query=사랑&display=20&start=1"
        
        let header = ["X-Naver-Client-Id": APIKey.navarID,
                      "X-Naver-Client-Secret": APIKey.naverSecret]
        
        AF.request(url, method: .get, headers: <#T##HTTPHeaders?#>).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let value):
             
                
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
