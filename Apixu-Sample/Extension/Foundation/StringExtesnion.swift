//
//  StringExtesnion.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

extension String {

    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func width (font: UIFont, constrainedToHeight height: Double) -> CGFloat {
        return NSString(string: self).boundingRect( with: CGSize(width: .greatestFiniteMagnitude, height: height), options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).size.width
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    func toArabicNumbers() -> String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $1, with: $0) }
        return str
    }

    func fromBase64() -> String? {

        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

    //    func localizedInArabic() -> String {
    //
    //        return LanguageHandler.arabicStringFor(self)
    //    }

    //    func localizedInEnglish() -> String {
    //
    //        return LanguageHandler.englishStringFor(self)
    //    }

    func toAbsolutURLString(_ baseUrl: String = NetworkDefault.baseURL) -> URL? {

        if self.isEmpty {
            return nil
        }

        if !self.contains("http") {
            return URL(string: baseUrl+"/"+self)
        }

        if let  urlString = self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) {

            return  URL(string: urlString)
        }
        return nil
    }
}
