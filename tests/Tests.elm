module Tests exposing (..)

import Test exposing (..)
import Expect
import ScheduleTime exposing (ScheduleTime, timeRange)
import Date exposing (Month(..))
import Date.Extra as Date


all : Test
all =
    describe "Test Suite"
        [ describe "Schedule Time"
            [ test "single value" <|
                \() ->
                    Expect.equal (timeRange (Date.fromParts 1999 Dec 31 1 0 0 0) (Date.fromParts 1999 Dec 31 1 0 0 0))
                        [ Date.fromParts 1999 Dec 31 1 0 0 0
                        ]
            , test "dual values" <|
                \() ->
                    Expect.equal (timeRange (Date.fromParts 1999 Dec 31 1 0 0 0) (Date.fromParts 1999 Dec 31 1 5 0 0))
                        [ Date.fromParts 1999 Dec 31 1 0 0 0
                        , Date.fromParts 1999 Dec 31 1 5 0 0
                        ]
            , test "multiple values" <|
                \() ->
                    Expect.equal (timeRange (Date.fromParts 1999 Dec 31 1 0 0 0) (Date.fromParts 1999 Dec 31 1 25 0 0))
                        [ Date.fromParts 1999 Dec 31 1 0 0 0
                        , Date.fromParts 1999 Dec 31 1 5 0 0
                        , Date.fromParts 1999 Dec 31 1 10 0 0
                        , Date.fromParts 1999 Dec 31 1 15 0 0
                        , Date.fromParts 1999 Dec 31 1 20 0 0
                        , Date.fromParts 1999 Dec 31 1 25 0 0
                        ]
            , test "across hour boundary" <|
                \() ->
                    Expect.equal (timeRange (Date.fromParts 1999 Dec 31 1 55 0 0) (Date.fromParts 1999 Dec 31 2 5 0 0))
                        [ Date.fromParts 1999 Dec 31 1 55 0 0
                        , Date.fromParts 1999 Dec 31 2 0 0 0
                        , Date.fromParts 1999 Dec 31 2 5 0 0
                        ]
            ]
        ]
