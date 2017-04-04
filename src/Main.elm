module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, id, style)
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
      , times = timeRange (Date.fromParts 2017 May 4 8 0 0 0) (Date.fromParts 2017 May 4 12 0 0 0)
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
    div []
        [ table [ style [ ( "border", "2px solid black" ) ] ]
            [ locationsView model.locations model.times
            ]
        ]


locationsView : List String -> List Date -> Html Msg
locationsView locations times =
    tr []
        (List.map
            (columnView times)
            locations
        )


columnView : List Date -> String -> Html Msg
columnView times location =
    td []
        [ table []
            (tr [] [ th [] [ text location ] ]
                :: (List.map
                        singleColumnRowView
                        times
                   )
            )
        ]


singleColumnRowView : Date -> Html Msg
singleColumnRowView time =
    tr [] [ td [ id (idTime time), style [ ( "height", "3em" ), ( "border", "1px dotted grey" ) ] ] [ text <| displayTime time ] ]


displayTime : Date -> String
displayTime date =
    Date.toFormattedString "h:mm a" date


idTime : Date -> String
idTime date =
    Date.toFormattedString "yyyy-MM-dd-h-mm" date
