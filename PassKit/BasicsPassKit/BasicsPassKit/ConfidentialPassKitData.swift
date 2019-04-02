//
//  ConfidentialPassKitData.swift
//  BasicsPassKit
//
//  Created by Harish Kumar on 02/04/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import Foundation
import PassKit

public class ConfidentialPassKitData: NSObject {
    static let shared: ConfidentialPassKitData = ConfidentialPassKitData()
    var SupportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]
    var ApplePayMerchantID = ""
}
