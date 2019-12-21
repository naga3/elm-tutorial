module Ellipse exposing (main)

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
    Model "100" "100"


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
            [ Html.text "幅"
            , Html.input
                [ HtmlAttr.type_ "number"
                , HtmlAttr.value model.width
                , HtmlEvent.onInput Width
                ]
                []
            ]
        , Html.div []
            [ Html.text "高さ"
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
            [ Svg.ellipse
                [ SvgAttr.cx "100"
                , SvgAttr.cy "100"
                , SvgAttr.rx model.width
                , SvgAttr.ry model.height
                , SvgAttr.fill "hotpink"
                ]
                []
            ]
        ]
