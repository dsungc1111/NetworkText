//
//  ViewController.swift
//  SeSAC0605NetworkBasicUpgrade
//
//  Created by 최대성 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

struct Lotto: Decodable {
    let totSellamnt: Int
    let drwNoDate: String
    
    var text: String {
        return "\(drwNoDate)\n1등 당첨 금액:  \(totSellamnt.formatted())"
    }
}



class ViewController: UIViewController {
    
    
    let numberTextField = UITextField()
    
    let checkButton = UIButton()
    
    let resultLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(numberTextField)
        view.addSubview(checkButton)
        view.addSubview(resultLabel)
    }
    
    func configureLayout() {
        numberTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        checkButton.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        resultLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(checkButton.snp.bottom).offset(20)
        }
    }
    
    
    
    
    func configureUI() {
        view.backgroundColor = .orange
        numberTextField.backgroundColor = .gray
        checkButton.backgroundColor = .blue
        checkButton.setTitle("로또 당첨 번호 확인 ", for: .normal)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.addTarget(self, action: #selector(chekcButtonClicked), for: .touchUpInside)
        resultLabel.backgroundColor = .brown
        resultLabel.numberOfLines = 0
        
    }
    // swift.DecodingError.keyNotFound
    // 1. url 확인
    // 2. responseString 확인하기
    // 3. nil에 대한 처리 > 선언을 옵셔널로 설정
    
    @objc func chekcButtonClicked() {
       
        let url = "\(APIURL.lottoURL)\(numberTextField.text!)"
        
        /*
         AF.request(url).responseString { response in
            switch response.result {
            case .success(let value):
                print(value.drwNoDate)
            case .failure(let error):
                print(error)
            }
         }
        */
        
    
        
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.resultLabel.text = value.text
                // 실행이 끝나고 나서도 출력할 수 있도록 붙잡아두는 것. > self
            case .failure(let error):
                self.resultLabel.text = "옳바른 값을 입력해주세요."
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    

}

