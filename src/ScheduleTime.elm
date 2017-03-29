module ScheduleTime exposing (..)

import Time exposing (inMilliseconds)
import Date exposing (Date, Month(..), toTime)
import Date.Extra as Date


type alias ScheduleTime =
    { date : Date }


timeRange : Date -> Date -> List Date
timeRange startTime endTime =
    List.map everyFiveMinutes (List.range (dateToMillis startTime) (dateToMillis endTime))


dateToMillis : Date -> Int
dateToMillis date =
    round (inMilliseconds (toTime date))



-- [ Date.fromParts 1999 Dec 31 1 minute 0 0 ]
-- List.map (\min -> ScheduleTime 1 min) (everyFive (minutesWithin startTime endTime))
-- minutesWithin : ScheduleTime -> ScheduleTime -> List Int
-- minutesWithin startTime endTime =
--     List.range startTime.minute endTime.minute
--
--


everyFiveMinutes : List Int -> List Int
everyFiveMinutes milliseconds =
    List.filter (\millesecond -> divisibleBy5 (millesecond * 1000 * 60)) milliseconds


divisibleBy5 : Int -> Bool
divisibleBy5 x =
    rem x 5 == 0
