module ScheduleTime exposing (..)

import Date exposing (Date, Month(..), toTime)
import Date.Extra as Date exposing (Interval(..))


type alias ScheduleTime =
    { date : Date }


minMinuteIncrement : Int
minMinuteIncrement =
    5


timeRange : Date -> Date -> List Date
timeRange startTime endTime =
    if (Date.diff Minute startTime endTime < minMinuteIncrement) then
        [ endTime ]
    else
        startTime
            :: (timeRange (Date.add Minute minMinuteIncrement startTime) endTime)
