module Main exposing (..)

import Html exposing (..)
import Item exposing (Item, itemView)
import ScheduleTime exposing (ScheduleTime, timeRange)
import Date exposing (Date, Month(..))
import Date.Extra as Date


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { locations : List String, times : List Date, items : List Item }


init : ( Model, Cmd Msg )
init =
    ( { locations = [ "Room A", "Room B", "Room C", "Room D", "Room E" ]
      , times = timeRange (Date.fromParts 2017 May 4 8 0 0 0) (Date.fromParts 2017 May 4 17 0 0 0)
      , items =
            [ { title = "First", speaker = "Jane", timeSlot = { day = 1, start = 1, end = 3 } }
            , { title = "Second", speaker = "Joe", timeSlot = { day = 2, start = 2, end = 3 } }
            , { title = "Third", speaker = "Fred", timeSlot = { day = 3, start = 4, end = 5 } }
            , { title = "Fourth", speaker = "Nayan", timeSlot = { day = 4, start = 1, end = 2 } }
            , { title = "Fifth", speaker = "Nayan", timeSlot = { day = 3, start = 3, end = 4 } }
            ]
      }
    , Cmd.none
    )


type Msg
    = Blah


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Blah ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    let
        timesViewForCount =
            timesView (List.length model.locations)
    in
        div []
            [ table [] ((locationsView model.locations) :: (List.map timesViewForCount model.times))
            , div [] (List.map itemView model.items)
            ]


locationsView : List String -> Html Msg
locationsView locations =
    tr []
        (th
            []
            []
            :: (List.map
                    (\location -> th [] [ text location ])
                    locations
               )
        )


timesView : Int -> Date -> Html Msg
timesView locationsCount time =
    tr []
        (td
            []
            [ text <| Date.toFormattedString "h:mm" time ]
            :: (List.repeat locationsCount (td [] [ text "." ]))
        )
