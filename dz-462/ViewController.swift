import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private var books: [BookModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor(red: 244 / 255, green: 240 / 255, blue: 205 / 255,alpha: 1)
        view.delegate = self
        view.dataSource = self
        view.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
        return view
    }()
    
    private lazy var nameTitle: UILabel = {
        let view = UILabel()
        view.text = "Книжные бестселлеры"
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .center
        view.backgroundColor = UIColor(red: 4 / 255, green: 191 / 255, blue: 191 / 255,alpha: 1)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        books.append(BookModel(image: "2222", price: "1239 сом", writer: "Джессами Хибберд", title: "Синдром самозванца."))
        books.append(BookModel(image: "1111", price: "299 сом", writer: "Сергей Лукьяненко", title: "Три дня Индиго"))
        books.append(BookModel(image: "3333", price: "333 сом", writer: "Патрик Кинг", title: "Читайте людей как книгу."))
        books.append(BookModel(image: "4444", price: "766 сом", writer: "Александра Белякова", title: "На богатом."))
        books.append(BookModel(image: "5555", price: "455 сом", writer: "Борис Акунин", title: "Просто Маса"))
        books.append(BookModel(image: "6666", price: "654 сом", writer: "Майк Омер", title: "Как ты умрешь"))
        books.append(BookModel(image: "7777", price: "766 сом", writer: "Фредрик Бакман", title: "Вторая жизнь Уве"))
        books.append(BookModel(image: "8888", price: "334 сом", writer: "Луиза Пенни", title: "Все дьяволы здесь"))
        books.append(BookModel(image: "9999", price: "655 сом", writer: "Патрик Кинг", title: "Как легко завести разговор с любым человеком."))
        books.append(BookModel(image: "0000", price: "343 сом", writer: "Энн Пэтчетт", title: "Голландский дом"))
        books.append(BookModel(image: "1212", price: "565 сом", writer: "Патрик Кинг", title: "Как быть веселым, остроумным и креативным"))
        books.append(BookModel(image: "1313", price: "234 сом", writer: "Сергей Лукьяненко", title: "Месяц за Рубиконом"))
        
        
        view.backgroundColor = UIColor(red: 244 / 255, green: 240 / 255, blue: 205 / 255,alpha: 1)
        
        view.addSubview(nameTitle)
        nameTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(view.frame.height * 0.05)
            make.height.equalTo(20)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.85)
            make.top.equalTo(nameTitle.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(25)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: (view.frame.width / 2) - 30,
            height: (view.frame.height / 2) - 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
        let model = books[index]
        
        cell.bookImage.image = UIImage(named: model.image)
        cell.bookPrice.text = String(model.price)
        cell.bookWriter.text = String(model.writer)
        cell.bookTitle.text = String(model.title)
        
        cell.bookStar.setOnClickListener { view in
            if view.image(for: .normal) == UIImage(named:"sss") {
                view.setImage(UIImage(named:"ss1"), for: .normal)
            } else {
                view.setImage(UIImage(named:"sss"), for: .normal)
            }
        }
        return cell
    }
}
