import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var backCourseLabel: UILabel!
    
    let currencyManager = CurrencyManager()
    var changeButtonSwitcher = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        currencyManager.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencyManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyManager.fetchCurrency(ticker: currencyManager.currencyArray[row])
    }
    
    @IBAction func changeButtonPressed(_ sender: UIButton) {
        guard currencyManager.updatedData != nil else { return }
        if changeButtonSwitcher {
            sender.setTitle("back", for: .normal)
            timeLabel.text = currencyManager.updatedData?.previousTime
            courseLabel.text = currencyManager.updatedData?.previousCourse
            backCourseLabel.text = currencyManager.updatedData?.previousBackCourse
            changeButtonSwitcher = false
        } else {
            sender.setTitle(currencyManager.updatedData?.change, for: .normal)
            timeLabel.text = currencyManager.updatedData?.time
            courseLabel.text = currencyManager.updatedData?.course
            backCourseLabel.text = currencyManager.updatedData?.backCourse
            changeButtonSwitcher = true
        }
    }
}

// MARK: - extension CurrencyManagerDelegate
extension ViewController: CurrencyManagerDelegate {
    func didUpdateCourse(_ currencyParsedData: DataForUpdateView) {
        print(currencyParsedData)
        changeButtonSwitcher = true
        timeLabel.text = currencyParsedData.time
        currencyLabel.text = currencyParsedData.ticker
        changeButton.setTitle(currencyParsedData.change, for: .normal)
        courseLabel.text = currencyParsedData.course
        backCourseLabel.text = currencyParsedData.backCourse
        changeButton.setTitleColor(currencyParsedData.buttonColor, for: .normal)
    }
    
    func didFailWithError(_ error: String) {
        print(error)
    }
}
