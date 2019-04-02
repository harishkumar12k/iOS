//
//  ViewController.swift
//  BasicsPassKit
//
//  Created by Harish Kumar on 02/04/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit
import PassKit

class ViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowPayment(_ sender: UIButton) {
        self.presentPaymentController()
    }
    
    func presentPaymentController() {
        let request = PKPaymentRequest()
        request.merchantIdentifier = ConfidentialPassKitData.shared.ApplePayMerchantID
        request.supportedNetworks = ConfidentialPassKitData.shared.SupportedPaymentNetworks
        request.merchantCapabilities = PKMerchantCapability.capability3DS
        request.countryCode = "IN"
        request.currencyCode = "INR"
        request.requiredShippingContactFields = [PKContactField.name, PKContactField.phoneNumber, PKContactField.postalAddress]
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "For Apple EarPod", amount: 12000),
        ]
        guard let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request) else { return () }
        applePayController.delegate = self
        self.present(applePayController, animated: true, completion: nil)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping ((PKPaymentAuthorizationStatus) -> Void)) {
        print("Payment Initiated")
        //After 5 Seconds Execution And Type are(.pinIncorrect, .pinLockout,.pinRequired, .failure, .success)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            completion(PKPaymentAuthorizationStatus.success)
        }
    }
    
    //On Cancel Tap
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

}

