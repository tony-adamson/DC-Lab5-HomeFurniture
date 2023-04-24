
import UIKit

class FurnitureDetailViewController: UIViewController {
    
    var furniture: Furniture?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        //В методе choosePhotoButtonTapped(_:) в FurnitureDetailViewController вам нужно создать и представить ваш action sheet. Сначала создайте экземпляр UIAlertController. Вы можете сделать параметры title и message равными nil, но нужно установить preferredStyle равным UIAlertControllerStyle.actionSheet.
        //Затем создайте UIAlertAction для отмены предупреждения и добавьте ее в ваш экземпляр UIAlertController. Как вы узнали, обработчик выполняет код после того, как кнопка нажата. По умолчанию кнопка, нажатая в UIAlertController, закрывает предупреждение, поэтому параметр handler может быть равен nil.
        //Далее вам нужно добавить еще два экземпляра UIAlertAction: один для выбора изображения из фотобиблиотеки и другой для использования камеры для создания нового изображения. Используйте функцию автозаполнения в Xcode, чтобы получить правильный синтаксис для включения параметра обработчика в эти действия. Вы можете оставить тела обработчиков пустыми на данный момент, но вам нужно будет вставить код позже, чтобы убедиться, что выбор источника изображения происходит правильно. Обязательно добавьте эти действия в ваш контроллер представления предупреждений. В конце метода представьте контроллер представлений предупреждений.
        //В конце метода необходимо вызвать метод present(_:animated:completion:) на экземпляре UIAlertController, чтобы представить созданный UIAlertController на экране.
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        
    }
    
}
