//
//  Date+Extension.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit

extension Date {
    // 获取星期几
    func weekDay() -> String {
        let weekDays = [NSNull.init(),"周日","周一","周二","周三","周四","周五","周六"] as [Any]
        let calendar = NSCalendar.init(calendarIdentifier: .gregorian)
        let timeZone = NSTimeZone.init(name: "Asia/Shanghai")
        calendar?.timeZone = timeZone! as TimeZone
        let calendarUnit = NSCalendar.Unit.weekday
        let theComponents = calendar?.components(calendarUnit, from: self)
        return weekDays[(theComponents?.weekday)!] as! String
    }
}
//将时间字符串转为NSDAte
public func dateWithStr(time: String) -> NSDate {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE MMM dd yyyy HH:mm:ss" // EEE MMM dd HH:mm:ss Z yyyy
    // 3. 设置时间的区域(真机必须设置，否则可能不会转换成功)
    formatter.locale = NSLocale(localeIdentifier: "en_CH") as Locale
    let createdDate = formatter.date(from: time)
    return createdDate! as NSDate
}
// 获取星期几
public func getWeekDay(dateTime: String) -> String {
    let weekDays = [NSNull.init(),"周一","周二","周三","周四","周五","周六","周日"] as [Any]
    let dateFmt = DateFormatter()
    dateFmt.dateFormat = "yyyy-MM-dd"
    let date = dateFmt.date(from: dateTime)
    let interval = Int(date!.timeIntervalSince1970)
    let days = Int(interval/86400) // 24*60*60
    let weekday = ((days + 4)%7+7)%7 + 1
    return weekDays[weekday == 0 ? 7 : weekday] as! String
}
//本月开始日期
public func startOfCurrentMonth() -> Date {
    let date = Date()
    let calendar = NSCalendar.current
    let components = calendar.dateComponents(
        Set<Calendar.Component>([.year, .month]), from: date)
    let startOfMonth = calendar.date(from: components)!
    return startOfMonth
}
//本月结束日期
public func endOfCurrentMonth(returnEndTime: Bool = false) -> Int {
    let calendar = NSCalendar.current
    var components = DateComponents()
    components.month = 1
    if returnEndTime {
        components.second = -1
    } else {
        components.day = -1
    }
    let endOfMonth =  calendar.date(byAdding: components, to: startOfCurrentMonth())!
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "dd"
    return Int(dateFormteer.string(from: endOfMonth))!
}

//获取当天日期
public func gettoday() -> Int {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "dd"
    return Int(dateFormteer.string(from: date as Date))!
}
//获取当前小时和分钟
public func getHoursAndMinutes() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormteer.string(from: date as Date)
}
//获取当前时间详细--
public func getNewTime() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormteer.string(from: date as Date)
}
public func getYearTime() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "yyyy-MM-dd"
    return dateFormteer.string(from: date as Date)
}
public func getYearNewTime() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "yyyy/MM/dd"
    return dateFormteer.string(from: date as Date)
}
//获取当前时间---HH:mm:ss 判断时间是否在某个时间段内
public  func isCurrentTime(startTime: String,endTime: String,time: String) -> Bool {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    // 3. 设置时间的区域(真机必须设置，否则可能不会转换成功)
    formatter.locale = NSLocale(localeIdentifier: "en") as Locale
    let createdDate = formatter.date(from: time)
    let start = formatter.date(from: startTime)
    let end = formatter.date(from: endTime)
    if (createdDate!.compare(start!) == .orderedDescending || createdDate!.compare(start!) == .orderedSame) && (createdDate!.compare(end!) == .orderedAscending) { //orderedDescending前者大于等于后者  orderedAscending后者大雨前者
        return true
    }
    return false
}
//比较两个时间谁在前谁在后
public func isTimeSize(oneTime: String,twoTime: String) -> Bool {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    // 3. 设置时间的区域(真机必须设置，否则可能不会转换成功)
    formatter.locale = NSLocale(localeIdentifier: "en") as Locale
    let start = formatter.date(from: oneTime)
    let end = formatter.date(from: twoTime)
    return start?.compare(end!) == .orderedDescending ? true : false
}
//比较那个时间包括年月日那个在前 后
public func isBeforeAndAfterTime(oneTime: String,twoTime: String) -> Bool {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    // 3. 设置时间的区域(真机必须设置，否则可能不会转换成功)
    formatter.locale = NSLocale(localeIdentifier: "en") as Locale
    let start = formatter.date(from: oneTime)
    let end = formatter.date(from: twoTime)
    return start?.compare(end!) == .orderedDescending ? true : false
}

//获取year
public func getyear() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "yyyy"
    return dateFormteer.string(from: date as Date)
}
//获取yue
public func getMonth() -> String {
    let date = NSDate()
    let dateFormteer = DateFormatter()
    dateFormteer.dateFormat = "MM"
    return dateFormteer.string(from: date as Date)
}
public func getTimes() -> [Int] {
    var timers: [Int] = [] //  返回的数组
    let calendar: Calendar = Calendar(identifier: .gregorian)
    var comps: DateComponents = DateComponents()
    comps = calendar.dateComponents([.year,.month,.day,.weekday,.hour,.minute,.second],from: Date())
    timers.append(comps.year!)  // 年 ，后2位数
    timers.append(comps.month!)            // 月
    timers.append(comps.day!)                // 日
    timers.append(comps.hour!)               // 小时
    timers.append(comps.minute!)            // 分钟
    timers.append(comps.second!)            // 秒
    timers.append(comps.weekday! - 1)      //星期
    return timers
}
public func getTimeStr(timeDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter.string(from: timeDate)
}
public func getOnlyTimeStr(timeDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: timeDate)
}
public func getTime(time: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: time)
}
