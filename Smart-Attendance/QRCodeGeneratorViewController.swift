//
//  QRCodeGeneratorViewController.swift
//  Smart-Attendance
//
//  Created by Devdas,Pavithra on 2/16/18.
//  Copyright © 2018 Modali,Naga Sravanthi. All rights reserved.
//

import UIKit
import LocalAuthentication

class QRCodeGeneratorViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var inputLBL: UIView!
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    
    @IBOutlet weak var inputSIDTF: UITextField!
    
    
    @IBAction func convert(_ sender: Any) {
        
        if let stringVal=inputSIDTF.text{
            let data = stringVal.data(using: .ascii, allowLossyConversion: false)
            let output=CIFilter(name: "CIQRCodeGenerator")
            output?.setValue(data, forKey: "inputMessage")
            let img=UIImage(ciImage: (output?.outputImage)!)
            firstImageView.image=img
        }
    }
    
    
    @IBAction func touchValidationBTN(_ sender: UIButton) {
        
        let authenticationContext = LAContext()
        //        var error: NSError
        print("in validation")
        
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            authenticationContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need your touch id", reply: { (wasSuccesful, error) in
                if wasSuccesful {
                    print("success")
//                    if let stringVal=self.inputSIDTF.text{
//                        let data = stringVal.data(using: .ascii, allowLossyConversion: false)
//                        let output=CIFilter(name: "CIQRCodeGenerator")
//                        output?.setValue(data, forKey: "inputMessage")
//                        let img=UIImage(ciImage: (output?.outputImage)!)
//                        self.firstImageView.image=img
//                    }
                }
                else{
                    print("touch id not authenticated")
                }
                
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
