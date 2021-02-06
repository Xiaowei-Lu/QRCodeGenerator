//
//  QRCodeView.swift
//  QRCodeGenerator
//
//  Created by Xiaowei on 12/9/20.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View{
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()//take the data and put it into QRCode
    var url : String
    
    //put in a UI image
    var body: some View{
        Image(uiImage: generateQRCodeImage(url: url))
            .interpolation(.none)//make the qrcode clear
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)//making our image bigger
    }
    //a func that we decide what image we're gonna put in
    func generateQRCodeImage( url : String) -> UIImage{
        let data = Data(url.utf8)//the data we're putting in today is url
        filter.setValue(data, forKey: "inputMessage")
        
        //grab our QRCode
        if let qrCodeImage = filter.outputImage{
            //qrCodeImage is a ci image and it's not readable by user interface, we need to convert into cg image
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        //if we fail return xmark
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
