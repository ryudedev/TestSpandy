//
//  Month.swift
//  TestSpandy
//
//  Created by IT on 2024/06/24.
//

import Foundation

struct Month
{
    var monthType: MonthType
    var dayInt : Int
    func day() -> String
    {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
}
