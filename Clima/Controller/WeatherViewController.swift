
import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }
    // Exit button
    @IBAction func Exit(_ sender: UIButton) {
        exit(0)
    }
    
    // Search button
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // close keybutton
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // close keybutton
        return true
    }
    
    // if textField is empty "Type someting"
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type someting"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use searchTextField.text to get the weather for that city.
        
        
        searchTextField.text = "" //clear previos text
    }

}

