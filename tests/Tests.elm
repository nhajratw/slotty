module Tests exposing (..)

import Test exposing (..)
import Expect
import ScheduleTime exposing (ScheduleTime, timeRange, divisibleBy5)


all : Test
all =
    describe "Sample Test Suite"
        [ describe "Schedule Time"
            [ test "single value" <|
                \() ->
                    Expect.equal (timeRange (ScheduleTime 1 0) (ScheduleTime 1 0))
                        [ ScheduleTime 1 0
                        ]
            , test "dual values" <|
                \() ->
                    Expect.equal (timeRange (ScheduleTime 1 0) (ScheduleTime 1 5))
                        [ ScheduleTime 1 0
                        , ScheduleTime 1 5
                        ]
            , test "multiple values" <|
                \() ->
                    Expect.equal (timeRange (ScheduleTime 1 0) (ScheduleTime 1 25))
                        [ ScheduleTime 1 0
                        , ScheduleTime 1 5
                        , ScheduleTime 1 10
                        , ScheduleTime 1 15
                        , ScheduleTime 1 20
                        , ScheduleTime 1 25
                        ]
            ]
        , describe
            "Divisible by 5"
            [ test "divisible" <|
                \() ->
                    Expect.equal (divisibleBy5 10) True
            , test "indivisible" <|
                \() ->
                    Expect.equal (divisibleBy5 7) False
            ]
        ]
