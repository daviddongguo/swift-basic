//
//  AddEditMediaViewController.swift
//  Dongguo
//
//  Created by david on 2023-03-23.
//

import UIKit

class AddEditMediaViewController: UITableViewController {
    
    var currentMedia: Media?
    var currentMediaType: MediaTypeEnum = .books
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var publicationYearTextField: UITextField!
    @IBOutlet weak var mediaTypeLabel: UILabel!
    @IBOutlet weak var mediaTypePikcer: UIPickerView!
    
    let mediaTypes = MediaTypeEnum.allCases
    var id: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaTypePikcer.delegate = self
        mediaTypePikcer.dataSource = self
        
        guard let currentMedia = currentMedia else {
            return
        }
        updateUI(currentMedia)
    }
    
    func updateUI(_ media: Media){
        id = media.id
        nameTextField.text = media.name
        publicationYearTextField.text = String(media.publicationYear)
        currentMediaType = media.type
        for i in 0..<mediaTypes.count {
            if mediaTypes[i] == currentMediaType {
                mediaTypePikcer.selectRow(i, inComponent: 0, animated: false)
                break
            }
        }
    }
    
    func updateSavebuttonState() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "fromSave" else {
            return
        }
        guard let name = nameTextField.text,
              let publicationYear = Int(publicationYearTextField.text ?? "no valid data") else {
                  return
              }
        
        currentMedia = Media(id: id, name: name, imagePath: "00.jpeg", publicationYear: publicationYear, type: currentMediaType )
    }
}

extension AddEditMediaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
//        mediaTypeLabel.text = "Meida type: " + currentMediaType.rawValue
    }
}
