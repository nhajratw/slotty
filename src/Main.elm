module Main exposing (..)

import Html exposing (..)
import Svg exposing (Svg, svg, rect, text_)
import Svg.Attributes exposing (version, viewBox, x, y, cx, cy, r, fill, width, height)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias TimeSlot =
    { day : Int, start : Int }


type alias Card =
    { title : String, speaker : String, timeSlot : TimeSlot }


type alias Model =
    { cards : List Card }


init : ( Model, Cmd Msg )
init =
    ( { cards =
            [ { title = "First", speaker = "Jane", timeSlot = { day = 1, start = 1 } }
            , { title = "Second", speaker = "Joe", timeSlot = { day = 2, start = 2 } }
            , { title = "Third", speaker = "Fred", timeSlot = { day = 3, start = 4 } }
            , { title = "Fourth", speaker = "Nayan", timeSlot = { day = 4, start = 1 } }
            , { title = "Fifth", speaker = "Nayan", timeSlot = { day = 3, start = 3 } }
            ]
      }
    , Cmd.none
    )



-- UPDATE


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


type alias Dot =
    { x : Int, y : Int }


view : Model -> Html Msg
view model =
    div []
        [ svg [ version "1.1", width "1440", height "800" ]
            (List.concatMap cardView model.cards)
        ]


cardView : Card -> List (Svg Msg)
cardView card =
    let
        y_ =
            card.timeSlot.start * 150

        x_ =
            card.timeSlot.day * 150
    in
        [ rect [ fill "lightblue", x (toString x_), y (toString y_), width "100", height "100" ] []
        , text_ [ x (toString (x_ + 20)), y (toString (y_ + 40)) ] [ text card.title ]
        ]
