//
//  ViewController.swift
//  UserDefaults
//
//  Created by Alexander Sobolev on 26.02.2021.
//

import UIKit

enum SexType: String {
    case male = "Male"
    case female = "Female"
}

class UserModel {
    var name: String
    var surname: String
    var sity: String
    var sex: SexType
    
    init(name: String, surname: String, sity: String, sex: SexType) {
        self.name = name
        self.surname = surname
        self.sity = sity
        self.sex = sex
    }
    
    
    
}

class ViewController: UIViewController {
    
    let cities = ["Vancouver", "Cupertino", "San Francisco", "Palo Alto", "Sydney"]
    var pickerCity: String?
    var pickedSex: SexType?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        cityPickerView.delegate = self
        name.delegate = self
        surname.delegate = self
        name.text = UserSettings.userName
        
        
    }

    @IBAction func nameTextField(_ sender: UITextField) {
    }
    
    @IBAction func surnameTextField(_ sender: UITextField) {
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pickedSex = .male
        case 1:
            pickedSex = .female
        default:
            break
        }
        
        guard let nameTrimmingText = name.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let surnameTrimmingText = surname.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let pickerCityNew = pickerCity, let pickerSexNew = pickedSex else { return }
        
        let userObject = UserModel(name: nameTrimmingText, surname: surnameTrimmingText, sity: pickerCityNew, sex: pickerSexNew)
        
        UserSettings.userName = nameTrimmingText
        
        print(UserSettings.userName)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCity = cities[row]
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
