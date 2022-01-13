import Foundation
import UIKit

class BookCell: UICollectionViewCell {
    
    lazy var bookImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(bookImage)
        bookImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bookImage.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
}
