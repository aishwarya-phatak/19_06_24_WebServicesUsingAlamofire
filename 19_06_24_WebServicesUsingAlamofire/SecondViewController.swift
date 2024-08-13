//
//  SecondViewController.swift
//  19_06_24_WebServicesUsingAlamofire
//
//  Created by Vishal Jagtap on 13/08/24.
//

import UIKit
import Alamofire

//way 2
class SecondViewController: UIViewController {
    
    var url : URL?
    var urlRequest : URLRequest?
    var bookApiResponse : BookAPIResponse1?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        url = URL(string: Constants.urlString)
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        parseJSON(urlRequest: urlRequest!)
    }
    
    func parseJSON(urlRequest : URLRequest){
        AF.request(urlRequest).response { res in
//            print(res.result)
            switch res.result{
                case .success(let data):
                self.bookApiResponse = try! JSONDecoder().decode(BookAPIResponse1.self, from: data!)
                
                for eachBook in self.bookApiResponse!.books{
                    print(eachBook)
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
