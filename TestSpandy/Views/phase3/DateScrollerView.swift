//
//  DateScrollerView.swift
//  TestSpandy
//
//  Created by IT on 2024/06/24.
//

import SwiftUI

struct DateScrollerView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        HStack
        {
            Text(getAttributedString(CalendarHelper().monthYearString(dateHolder.date)))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            HStack(spacing: 24)
            {
                Button(action: previousMonth)
                {
                    Image(systemName: "chevron.backward")
                        .imageScale(.medium)
                    //                    .font(Font.title.weight(.bold))
                        .foregroundStyle(Color.black)
                }
                Button(action: nextMonth)
                {
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                    //                    .font(Font.title.weight(.bold))
                        .foregroundStyle(Color.black)
                }
            }
            Button(action: {print("click")})
            {
                Image(systemName: "ellipsis")
                    .imageScale(.medium)
//                    .font(Font.title.weight(.bold))
                    .foregroundStyle(Color.black)
            }
        }
        .padding(.horizontal)
    }
    
    func getAttributedString(_ str: String) -> AttributedString {
        var attributedString = AttributedString(str)
            
            // 正規表現で数値を検索
            let regex = try! NSRegularExpression(pattern: "\\d+", options: [])
            let nsString = NSString(string: str)
            let results = regex.matches(in: str, options: [], range: NSRange(location: 0, length: nsString.length))
            
            // 検出された数値にスタイルを適用
            for match in results {
                if let range = Range(match.range, in: str) {
                    let attributedRange = attributedString.range(of: String(str[range]))!
                    attributedString[attributedRange].foregroundColor = Color.grey200
                    attributedString[attributedRange].font = .custom("HiraKakuStd-w7", size: 12)
                }
            }
            
            return attributedString
    }
    
    func previousMonth()
    {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth()
    {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
}

#Preview {
    DateScrollerView()
}
