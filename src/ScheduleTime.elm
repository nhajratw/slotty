module ScheduleTime exposing (..)

import Time exposing (inMilliseconds, minute)
import Date exposing (Date, Month(..), toTime)
import Date.Extra as Date exposing (Interval(..))


type alias ScheduleTime =
    { date : Date }


timeRange : Date -> Date -> List Date
timeRange startTime endTime =
    if (Date.diff Minute startTime endTime < 5) then
        [ endTime ]
    else
        startTime
            :: (timeRange (Date.add Minute 5 startTime) endTime)


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
