//
//  ViewController.swift
//  FlashCheckout
//
//  Created by Jaival Bhuptani on 2021-03-23.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var frameImg: UIImageView!
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    let allowedBarcodes = [AVMetadataObject.ObjectType.upce,
                               AVMetadataObject.ObjectType.code39,
                               AVMetadataObject.ObjectType.code39Mod43,
                               AVMetadataObject.ObjectType.ean13,
                               AVMetadataObject.ObjectType.ean8,
                              AVMetadataObject.ObjectType.code93,
                              AVMetadataObject.ObjectType.code128,
                              AVMetadataObject.ObjectType.pdf417,
                              AVMetadataObject.ObjectType.qr,
                              AVMetadataObject.ObjectType.aztec
                          ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Looking for code..."
        // Create Session
        guard let camera = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Device not found")
            return
        }
        do{
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            session.addInput(cameraInput)
        }
        catch{
            print(error.localizedDescription)
        }
        
        let cameraOutput = AVCaptureMetadataOutput()
        session.addOutput(cameraOutput)
        cameraOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        cameraOutput.metadataObjectTypes = cameraOutput.availableMetadataObjectTypes
        video = AVCaptureVideoPreviewLayer(session: session)
        //Fill the entire screen
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(frameImg)
        //start session
        session.startRunning()
            
        
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count>0{
            if allowedBarcodes.contains(metadataObjects[0].type){
                if let metaData = (metadataObjects[0] as! AVMetadataMachineReadableCodeObject).stringValue as String?{
                    let alert = UIAlertController(title: "Got The Code", message: "\(metaData)", preferredStyle: .alert)
                    let ac1 = UIAlertAction(title: "Continue", style: .default, handler: nil)
                    let ac2 = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                    alert.addAction(ac1)
                    alert.addAction(ac2)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
//        for metaData in metadataObjects{
//            if allowedBarcodes.contains(metaData.type){
//                let barcode = (metaData as! AVMetadataMachineReadableCodeObject).stringValue as String?
//                self.session.stopRunning()
//                print(barcode)
            //}
//            for barcodeType in allowedBarcodes{
//                if metaData.type == barcodeType{
//                    let barcode = (metaData as! AVMetadataMachineReadableCodeObject).stringValue as String?
//                    self.session.stopRunning()
//                    print(barcode)
//                }
//            }
        //}
    }
    


}

