//
//  ViewController.swift
//  19_06_24_WebServicesUsingAlamofire
//
//  Created by Vishal Jagtap on 12/08/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var url : URL?
    var urlRequest : URLRequest?
    var books : [Book] = []

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
                    let bookAPIResponse = try! JSONDecoder().decode(BookApiResponse.self, from: data!)
                self.books = bookAPIResponse.books
//                print(bookAPIResponse.books)
//                print(self.books)
                
                for eachBook in self.books{
                    print(eachBook)
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
