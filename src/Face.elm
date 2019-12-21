module Face exposing (main)

import Browser
import Html
import Html.Attributes as HtmlAttr
import Html.Events as HtmlEvent
import Svg
import Svg.Attributes as SvgAttr


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { width : String
    , height : String
    }


init : Model
init =
    Model "50" "20"


type Msg
    = Width String
    | Height String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Width width ->
            { model | width = width }

        Height height ->
            { model | height = height }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.div []
            [ Html.text "口の幅"
            , Html.input
                [ HtmlAttr.type_ "number"
                , HtmlAttr.value model.width
                , HtmlEvent.onInput Width
                ]
                []
            ]
        , Html.div []
            [ Html.text "口の高さ"
            , Html.input
                [ HtmlAttr.type_ "number"
                , HtmlAttr.value model.height
                , HtmlEvent.onInput Height
                ]
                []
            ]
        , Svg.svg
            [ SvgAttr.width "500"
            , SvgAttr.height "500"
            , SvgAttr.viewBox "0 0 500 500"
            ]
            [ -- Ears
              Svg.circle
                [ SvgAttr.cx "50"
                , SvgAttr.cy "180"
                , SvgAttr.r "30"
                , SvgAttr.fill "bisque"
                ]
                []
            , Svg.circle
                [ SvgAttr.cx "250"
                , SvgAttr.cy "180"
                , SvgAttr.r "30"
                , SvgAttr.fill "bisque"
                ]
                []

            -- Contour
            , Svg.rect
                [ SvgAttr.x "50"
                , SvgAttr.y "50"
                , SvgAttr.width "200"
                , SvgAttr.height "250"
                , SvgAttr.rx "50"
                , SvgAttr.ry "50"
                , SvgAttr.fill "bisque"
                ]
                []

            -- Hair
            , Svg.rect
                [ SvgAttr.x "40"
                , SvgAttr.y "30"
                , SvgAttr.width "220"
                , SvgAttr.height "100"
                , SvgAttr.rx "30"
                , SvgAttr.ry "30"
                , SvgAttr.fill "darkred"
                ]
                []

            -- Eyes
            , Svg.circle
                [ SvgAttr.cx "110"
                , SvgAttr.cy "180"
                , SvgAttr.r "30"
                , SvgAttr.fill "white"
                ]
                []
            , Svg.circle
                [ SvgAttr.cx "110"
                , SvgAttr.cy "180"
                , SvgAttr.r "20"
                , SvgAttr.fill "midnightblue"
                ]
                []
            , Svg.circle
                [ SvgAttr.cx "190"
                , SvgAttr.cy "180"
                , SvgAttr.r "30"
                , SvgAttr.fill "white"
                ]
                []
            , Svg.circle
                [ SvgAttr.cx "190"
                , SvgAttr.cy "180"
                , SvgAttr.r "20"
                , SvgAttr.fill "midnightblue"
                ]
                []

            -- Mouth
            , Svg.ellipse
                [ SvgAttr.cx "150"
                , SvgAttr.cy "250"
                , SvgAttr.rx model.width
                , SvgAttr.ry model.height
                , SvgAttr.fill "lightcoral"
                ]
                []
            ]
        ]
