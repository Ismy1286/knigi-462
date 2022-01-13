import Foundation

class BookModel {
    var image: String
    var price: String
    var writer: String
    var title: String
    
    
    init(image: String, price: String, writer: String, title: String) {
        self.image = image
        self.price = price
        self.writer = writer
        self.title = title
    }
}
