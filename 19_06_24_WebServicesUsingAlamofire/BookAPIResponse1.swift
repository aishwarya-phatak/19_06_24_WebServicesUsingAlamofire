//
//  BookAPIResponse1.swift
//  19_06_24_WebServicesUsingAlamofire
//
//  Created by Vishal Jagtap on 12/08/24.
//

import Foundation


//model class creation using way 2
struct Book1{
    var title : String
    var subtitle : String
    var isbn13 : String
    var price : String
    var image : String
    var url : String
}

struct BookAPIResponse1:Decodable{
    var error : String
    var total : String
    var books : [Book1]
    
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
        
        var nestedContainer = try container.nestedUnkeyedContainer(forKey: .books)
        
        var booksArray : [Book1] = []
        
        while !nestedContainer.isAtEnd{
            let booksContainer = try nestedContainer.nestedContainer(keyedBy: BookCodingKeys.self)
            let title = try booksContainer.decode(String.self, forKey: .title)
            let subtitle = try booksContainer.decode(String.self, forKey: .subtitle)
            let isbnNumber = try booksContainer.decode(String.self, forKey: .isbnNumber)
            let price = try booksContainer.decode(String.self, forKey: .price)
            let image = try booksContainer.decode(String.self, forKey: .image)
            let url = try booksContainer.decode(String.self, forKey: .url)
            
            let book1 = Book1(title: title,
                      subtitle: subtitle,
                      isbn13: isbnNumber,
                      price: price,
                      image: image,
                      url: url)
            
            booksArray.append(book1)
        }
        self.books = booksArray
    }
}
