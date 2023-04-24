
import UIKit

class FurnitureDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        //создаем экземпляр класса UIImagePickerController и установим его делегатом
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //созадем экземпляр класса UIAlertController
        let alertController = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
        
        //создаем кнопки как экземпляры UIAlertAction, основные с замыканиями
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        //презентуем пользователю после нажатия кнопки
        present(alertController, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        furniture?.imageData = selectedImage.jpegData(compressionQuality: 0.9)
        dismiss(animated: true)
        updateView()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        //Из метода actionButtonTapped(_:) используйте UIActivityViewController, чтобы добавить возможность обмена изображением и описанием элемента мебели Furniture.
        //From the actionButtonTapped(_:) method, use the UIActivityViewController to add the ability to share the image and description from the Furniture item.
        guard let image = photoImageView.image, let description = furnitureDescriptionLabel.text else { return }
        
        let activityController = UIActivityViewController(activityItems: [image, description], applicationActivities: nil)
        
        present(activityController, animated: true)
    }
    
}
