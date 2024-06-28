//
//  PairInfoView.swift
//  TestSpandy
//
//  Created by IT on 2024/06/18.
//

import SwiftUI
import Algorithms

struct PairInfoView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    private func changeDate(date: Date) -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone(secondsFromGMT: 0)
        // 出力の日付形式を設定
        df.dateFormat = "MMM yyyy"
        let formattedDateString = df.string(from: date)
        let afterDate = formattedDateString.components(separatedBy: " ")
        return formattedDateString
    }
    
    private let PairUser: [Person] = [
        .init(id: "bc34def5-6789-0123-c45d-e6f7g8h9i0j1",
               first_name: "Robert",
               last_name: "Downey Jr.",
               age: 58,
               password: "2fj29jf3n3jfkfslf",
               email: "robertdowneyjr@example.com",
               gender: 1,
               birthday: "Sun, Apr 4, '65",
               nationality: "United States",
               selfPR: "As Robert Downey Jr., I embrace my iconic status in the film industry while promoting my work and personal brand. Known for my role as Iron Man, I engage with fans through social media and public appearances. My PR strategy focuses on maintaining a balance between my professional achievements and personal life. I support various charitable initiatives and advocate for environmental sustainability, using my platform to inspire positive change.",
               special_note: "",
               carrer_id: "4",
               height: 174,
               weight: 78,
               is_supporter: false,
               paire_id: "5a61cfd3-77b2-48f1-a3b8-8e29b8e2c53e",
               created_at: "2023-02-03 12:15:00",
               updated_at: "2023-02-03 12:15:00"),
        .init(id: "5a61cfd3-77b2-48f1-a3b8-8e29b8e2c53e",
               first_name: "Emma",
               last_name: "Watson",
               age: 33,
               password: "3fj83nflskf39fsklfj39",
               email: "emmawatson@example.com",
               gender: 0,
               birthday: "Sun, Apr 15, '90",
               nationality: "United Kingdom",
               selfPR: "As Emma Watson, I combine my acting career with my advocacy for women's rights and education. Best known for my role as Hermione Granger in the Harry Potter series, I continue to take on diverse roles in film. My PR strategy involves highlighting my work in both the entertainment industry and my humanitarian efforts. I actively engage with my audience on social media, participate in interviews, and attend events to promote my initiatives. My goal is to inspire and empower others through my platform.",
               special_note: "",
               carrer_id: "3",
               height: 165,
               weight: 53,
               is_supporter: true,
               paire_id: "bc34def5-6789-0123-c45d-e6f7g8h9i0j1",
               created_at: "2023-02-02 11:30:00",
               updated_at: "2023-02-02 11:30:00")
    ]
    
    var body: some View {
//        ScrollView {
            ZStack {
                VStack(alignment: .leading, spacing: 17) {
                    productionCardView
                    VStack(alignment: .leading, spacing: 10) {
                        Text("共有カレンダー")
                            .foregroundColor(Color.grey400)
                            .font(.custom("HiraKakuStd-W7", size: 12))
                            .padding(.horizontal)
                        VStack(spacing: 10)
                        {
                            DateScrollerView()
                                .environmentObject(dateHolder)
                            VStack
                            {
                                dayOfWeekStack
                                calendarGrid
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(24)
                    }
                    Spacer()
                }
                .padding()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    var dayOfWeekStack: some View
    {
        HStack(spacing: 1)
        {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
    }
    
    var calendarGrid: some View
    {
        VStack(spacing: 1)
        {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<6)
            {
                row in
                HStack(spacing: 1)
                {
                    ForEach(1..<8)
                    {
                        column in
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces:startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                        
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    PairInfoView()
}


extension PairInfoView {
    private var productionCardView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(PairUser.indexed(), id: \.element) { index, user in
                    HStack(alignment: .center, spacing: 40) {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 80, height: 80)
                            .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                        VStack(alignment: .leading) {
                            Text("\(user.first_name) \(user.last_name)")
                                .font(.custom("HiraKakuStd-W7", size: 20))
                            Text("age \(user.age)")
                                .font(.custom("HiraKakuStd-W7", size: 12))
                        }
                        .frame(alignment: .leading)
                    }
                    .padding(24)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .background(index == 0 ? Color.white : Color.green600)
                }
            }
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 4)
            Image("Connected")
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .frame(width: 24, height: 24)
                .foregroundStyle(
                    Gradient(colors: [
                        Color.green600,Color.white
                    ])
                )
        }
    }
    
    
}

extension Text
{
    func dayOfWeek() -> some View
    {
        self.font(.custom("HiraKakuStd-w7", size: 12))
            .foregroundStyle(Color.grey200)
            .frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
