module Item exposing (Item, itemView)

import Html exposing (..)
import Material.Card as Card
import Material.Options as Options exposing (css)


type alias TimeSlot =
    { day : Int, start : Int, end : Int }


type alias Item =
    { title : String, speaker : String, timeSlot : TimeSlot }


itemView : Item -> Html msg
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
