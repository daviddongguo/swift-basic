//
//  AddEditMediaViewController.swift
//  Dongguo
//
//  Created by david on 2023-03-23.
//

import UIKit

class DetailTableView: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var currentMedia: Media?
    var currentMediaType: MediaTypeEnum = .books
    var manager: MediaManager?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var mediaImageUI: UIImageView!
    @IBOutlet weak var nameErrorMessageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var publicationYearTextField: UITextField!
    @IBOutlet weak var mediaTypeLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var mediaTypePikcer: UIPickerView!
    
    let mediaTypes = MediaTypeEnum.allCases
    var id: Int = -1
    
    
    @IBAction func ChangeImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            dismiss(animated: true, completion: nil)
            return
        }
        //:TODO save image
        mediaImageUI.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func DidEditingName(_ sender: Any) {
        if isExistedName() {
            nameErrorMessageLabel.text = "Duplicated name"
            nameErrorMessageLabel.textColor = .red
            nameErrorMessageLabel.isHidden = false
        }else{
            nameErrorMessageLabel.isHidden = true
        }
        updateSaveButtonState()
    }
    
    
    @IBAction func nameChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func yearChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBOutlet weak var descriptionChanged: UITextView!
    fileprivate func isExistedName() -> Bool{
        guard let name = nameTextField.text,
              let manager = manager else {
            return false
        }
        if manager.isExisted(name: name) {
            return true
        }
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaTypePikcer.delegate = self
        mediaTypePikcer.dataSource = self
        
        updateUI(currentMedia)
        updateSaveButtonState()
    }
    
    func updateUI(_ media: Media?){
        guard let media = media else {
            id = -1
            nameTextField.text = ""
            nameErrorMessageLabel.isHidden = true
            publicationYearTextField.text = ""
            currentMediaType = .movies
            mediaTypePikcer.selectRow(0, inComponent: 0, animated: false)
            descriptionTextView.text =  ""
            return
        }
        
        id = media.id
        nameTextField.text = media.name
        nameErrorMessageLabel.isHidden = true
        publicationYearTextField.text = String(media.publicationYear)
        currentMediaType = media.type
        for i in 0..<mediaTypes.count {
            if mediaTypes[i] == currentMediaType {
                mediaTypePikcer.selectRow(i, inComponent: 0, animated: false)
                break
            }
        }
        descriptionTextView.text = media.description
    }
    
    func updateSaveButtonState() {
        let name = nameTextField.text ?? ""
        let year = publicationYearTextField.text ?? ""
        let descriptionText = descriptionTextView.text ?? ""
        
        saveButton.isEnabled = !name.isEmpty &&
        !year.isEmpty &&
        !descriptionText.isEmpty
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if identifier  == "fromSave"  && isExistedName() {
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "fromSave" else {
            return
        }
        guard let name = nameTextField.text,
              let publicationYear = Int(publicationYearTextField.text ?? "no valid data"),
              let description = descriptionTextView.text else {
            return
        }
        
        currentMedia = Media(id: id, name: name, imagePath: "00.jpeg", publicationYear: publicationYear, type: currentMediaType, description: description )
    }
}

extension DetailTableView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mediaTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mediaTypes[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = pickerView.selectedRow(inComponent: component)
        currentMediaType = mediaTypes[selectedValue]
    }
}
