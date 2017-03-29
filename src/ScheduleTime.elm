module ScheduleTime exposing (..)


type alias ScheduleTime =
    { hour : Int, minute : Int }


timeRange : ScheduleTime -> ScheduleTime -> List ScheduleTime
timeRange startTime endTime =
    List.map (\min -> ScheduleTime 1 min) (everyFive (minutesWithin startTime endTime))


minutesWithin : ScheduleTime -> ScheduleTime -> List Int
minutesWithin startTime endTime =
    List.range startTime.minute endTime.minute


everyFive : List Int -> List Int
everyFive minutes =
    List.filter (\minute -> divisibleBy5 minute) minutes


divisibleBy5 : Int -> Bool
divisibleBy5 x =
    rem x 5 == 0
