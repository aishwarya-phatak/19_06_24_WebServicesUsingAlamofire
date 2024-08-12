//
//  BookApiResponse.swift
//  19_06_24_WebServicesUsingAlamofire
//
//  Created by Vishal Jagtap on 12/08/24.
//

import Foundation
struct BookApiResponse : Decodable{
    var error : String
    var total : String
    var books : [Book]
}

struct Book : Decodable{
    var title : String
    var subtitle : String
    var isbn13 : String
    var price : String
    var image : String
    var url : String
}
