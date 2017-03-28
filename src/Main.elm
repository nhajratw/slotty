module Main exposing (..)

import Html exposing (..)
import Material.Card as Card
import Material.Options as Options exposing (css)


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
    { day : Int, start : Int, end : Int }


type alias Item =
    { title : String, speaker : String, timeSlot : TimeSlot }


type alias Model =
    { items : List Item }


init : ( Model, Cmd Msg )
init =
    ( { items =
            [ { title = "First", speaker = "Jane", timeSlot = { day = 1, start = 1, end = 3 } }
            , { title = "Second", speaker = "Joe", timeSlot = { day = 2, start = 2, end = 3 } }
            , { title = "Third", speaker = "Fred", timeSlot = { day = 3, start = 4, end = 5 } }
            , { title = "Fourth", speaker = "Nayan", timeSlot = { day = 4, start = 1, end = 2 } }
            , { title = "Fifth", speaker = "Nayan", timeSlot = { day = 3, start = 3, end = 4 } }
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
    div [] (List.map itemView model.items)


itemView : Item -> Html Msg
itemView item =
    let
        y_ =
            item.timeSlot.start * 150

        height_ =
            (item.timeSlot.end - item.timeSlot.start) * 100

        x_ =
            item.timeSlot.day * 150
    in
        Card.view
            [ css "width" "256px", css "border" "1px solid black", css "background-color" "lightblue" ]
            [ Card.title
                [ css "flex-direction" "column" ]
                [ Card.head [] [ text item.title ]
                , Card.subhead [] [ text item.speaker ]
                , Options.div
                    [ css "padding" "2rem 2rem 0 2rem" ]
                    []
                ]
            ]
