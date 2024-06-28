//
//  CalendarCell.swift
//  TestSpandy
//
//  Created by IT on 2024/06/24.
//

import SwiftUI

struct CalendarCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    let count : Int
    let startingSpaces : Int
    let daysInMonth : Int
    let daysInPrevMonth : Int
    
    var body: some View
    {
        Text(monthStruct().day())
            .font(.custom("HiraKakuStd-w7", size: 12))
            .foregroundColor(textColor(type: monthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom)
    }
    func textColor(type: MonthType) -> Color
    {
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    func monthStruct() -> Month
    {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if(count <= start)
        {
            let day = daysInPrevMonth + count - start
            return Month(monthType: MonthType.Previous, dayInt: day)
        }
        else if (count - start > daysInMonth)
        {
            let day = count - start - daysInMonth
            return Month(monthType: MonthType.Next, dayInt: day)
        }
        
        let day = count - start
        return Month(monthType: MonthType.Current, dayInt: day)
    }
}

#Preview {
    CalendarCell(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
}
