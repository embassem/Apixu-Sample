//
//  UIImageExtension.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

extension UIImage {

    func toPNGBase64() -> String? {

        return self.pngData()?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

    func toJPEGBase64( toImgeQuality: CGFloat) -> String? {

        return self.jpegData(compressionQuality: toImgeQuality)?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

    func toCompressedData( afterCompressingQuality: CGFloat) -> Data? {

        return self.jpegData(compressionQuality: afterCompressingQuality)
    }

    func toJPEGBase64(maxKB maxSize: Int) -> String? {

        var imgData: Data? = self.toCompressedData(afterCompressingQuality: 1)

        guard imgData != nil else { return nil }

        while imgData?.sizeInKB() ?? 0 > maxSize {

            if let dataToBeCompressd = imgData ,
                let compressedData = UIImage (data: dataToBeCompressd)?.toCompressedData(afterCompressingQuality: 0.9) {

                imgData = compressedData
            } else {
                imgData = nil
            }
        }

        return imgData?.toBase64String()
    }
}
