import UIKit
protocol SearchLocationDelegate {
    func searchLocation(latValue:String, logValue:String)
}

class NextViewController: UIViewController {

    @IBOutlet var latTextField: UITextField!
    @IBOutlet var logTextField: UITextField!
    var delegate:SearchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okAction(_ sender: Any) {
        // 入力された値を取得
        let latValue = latTextField.text!
        let logValue = logTextField.text!
        

        // 両方のTFが空でなければ戻る
        if latTextField.text != nil || logTextField.text != nil{
            // デリゲートメソッドの引数に入れる
            delegate?.searchLocation(latValue: latValue, logValue: logValue)
            dismiss(animated: true, completion: nil)
        }
    }

}
