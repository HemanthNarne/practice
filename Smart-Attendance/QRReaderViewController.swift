//
//  QRReaderViewController.swift
//  Smart-Attendance
//
//  Created by Devdas,Pavithra on 3/9/18.
//  Copyright © 2018 Modali,Naga Sravanthi. All rights reserved.
//

import UIKit
import AVFoundation

class QRReaderViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video=AVCaptureVideoPreviewLayer()
    
    @IBOutlet weak var square: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Detetcting the OR Codes
        
        //Creating a session
        let session=AVCaptureSession()
      
        //Define to capture video
        let captureDevice=AVCaptureDevice.default(for: AVMediaType.video)
        
        
        //Add capture device into session
        
        do{
            //input for session
            let input=try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch{
            print("ERROR")
        }
        //output comes out of the session
        let output=AVCaptureMetadataOutput()
        session.addOutput(output)
        
        //define main queue where output is being processed
      //process this on main thread
        
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes=[AVMetadataObject.ObjectType.qr]
        
        //define what type results you want
        video=AVCaptureVideoPreviewLayer(session:session)
        video.frame=view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: square)
        
        session.startRunning()
        
       // let captureDevice=AVCaptureDevice.default(for: AVMediaType)

        // Do any additional setup after loading the view.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0{
            //to process furthur
            if let object=metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                if object.type==AVMetadataObject.ObjectType.qr{
                    let alert=UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Attendance taken", style: .default, handler: {(nil) in
                        UIPasteboard.general.string=object.stringValue
                    }))
                    present(alert,animated: true,completion: nil)
                    
                
            }
        }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
