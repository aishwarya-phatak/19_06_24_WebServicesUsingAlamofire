//
//  BookAPIResponse1.swift
//  19_06_24_WebServicesUsingAlamofire
//
//  Created by Vishal Jagtap on 12/08/24.
//

import Foundation

//way 2
struct BookAPIResponse1:Decodable{
    var error : String
    var total : String
    var title : String
    var subtitle : String
    var isbn13 : String
    var price : String
    var image : String
    var url : String
    
    enum APIResposneKeys:String,CodingKey {
        case error
        case total
        case books
    }
    
    enum BookCodingKeys : String,CodingKey{
        case title
        case subtitle
        case isbnNumber = "isbn13"
        case price
        case image
        case url
    }
    
    init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: APIResposneKeys.self)
        self.error = try container.decode(String.self, forKey: .error)
        self.total = try container.decode(String.self, forKey: .total)
        
        var booksContainer = try container.nestedContainer(keyedBy: BookCodingKeys.self, forKey: .books)
        
        while !booksContainer.codingPath.isEmpty{
            
            self.title = try booksContainer.decode(String.self, forKey: .title)
            self.subtitle = try booksContainer.decode(String.self, forKey: .subtitle)
            self.isbn13 = try booksContainer.decode(String.self, forKey: .isbnNumber)
            self.price = try booksContainer.decode(String.self, forKey: .price)
            self.image = try booksContainer.decode(String.self, forKey: .image)
            self.url = try booksContainer.decode(String.self, forKey: .url)
                     Book(title:self.title,
                          subtitle: self.subtitle,
                          isbn13: self.isbn13,
                          price: self.price,
                          image: self.image,
                          url: self.url)
            
        }
       
    }
}
