//
//  DateExtension.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//
import Foundation

extension Date {

    static var dateFormater: DateFormatter = {
        return DateFormatter ()
    } ()

    static var islamicCalendar: Calendar = {

        let calendar: Calendar = Calendar (identifier: .islamicUmmAlQura)

        return calendar
    }()

    static var gregorianCalendar: Calendar = {

        let calendar: Calendar = Calendar (identifier: .gregorian)

        return calendar
    }()

    // ------------------------------------------------------------------------------

    static func date( milliSeconds: Double?) -> Date? {

        guard milliSeconds != nil else { return nil }

        return Date (timeIntervalSince1970: TimeInterval ( milliSeconds! / 1000) )
    }

    static func date( seconds: Double?) -> Date? {

        guard seconds != nil else { return nil }

        return Date (timeIntervalSince1970: TimeInterval ( seconds!) )
    }

    static func date(_ dateString: String, inFormat formatString: String) -> Date? {

        Date.dateFormater.dateFormat = formatString

        Date.dateFormater.locale = Locale (identifier: "en")
        Date.dateFormater.calendar = Date.gregorianCalendar

        return Date.dateFormater.date(from: dateString)
    }

    func toMilliSeconds () -> Double {
        return self.timeIntervalSince1970 * 1000
    }

    func toSeconds () -> Double {
        return self.timeIntervalSince1970
    }

    // ------------------------------------------------------------------------------

    func toString(_ formate: String) -> String {

        Date.dateFormater.dateFormat = formate

        Date.dateFormater.locale = Locale (identifier: "en")
        Date.dateFormater.calendar = Date.gregorianCalendar

        return Date.dateFormater.string(from: self)
    }

    func toArbicString(_ formate: String) -> String {

        Date.dateFormater.dateFormat = formate

        Date.dateFormater.locale = Locale (identifier: "ar_EH")
        Date.dateFormater.calendar = Date.gregorianCalendar

        return Date.dateFormater.string(from: self)
    }
    // --------------------------------------------------
    func toIslamicString(_ formate: String) -> String {

        Date.dateFormater.dateFormat = formate

        Date.dateFormater.locale = Locale (identifier: "EH")
        Date.dateFormater.calendar = Date.islamicCalendar

        return Date.dateFormater.string(from: self)
    }

    func toArbicIslamicString(_ formate: String) -> String {

        Date.dateFormater.dateFormat = formate

        Date.dateFormater.locale = Locale (identifier: "ar_EH")
        Date.dateFormater.calendar = Date.islamicCalendar

        return Date.dateFormater.string(from: self)
    }
}
