//
//  ViewController.swift
//  SamplePDFKit
//
//  Created by Harish Kumar on 04/05/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet var pdfView: PDFView!
    @IBOutlet var pdfThumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let path = Bundle.main.path(forResource: "SapmlePdfFile", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url: url) {
                pdfView.document = pdfDocument
                pdfThumbnail.image = getThumbnailForPDF(page: pdfDocument.page(at: 0)! )
            }
        }
    }
    
    func getThumbnailForPDF(page : PDFPage) -> UIImage {
        let size = CGSize(width: pdfThumbnail.frame.width , height: pdfThumbnail.frame.height)
        return page.thumbnail(of: size, for: .artBox)
    }

}

