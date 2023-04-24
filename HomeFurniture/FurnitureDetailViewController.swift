
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
        
        //созадем экземпляр класса UIAlertController
        let alertController = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
        
        //создаем кнопки как экземпляры UIAlertAction, основные с замыканиями
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            print("User choose camera")
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            print("User chhose photo library")
        }
        
        //добавляем кнопки в alertController
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        //презентуем пользователю после нажатия кнопки
        present(alertController, animated: true)
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        
    }
    
}
