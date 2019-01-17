import Browser
import Array
import String
import Html exposing (Html, button, br, div, text, form, input, ul, li, p)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (width, value, type_)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = 
    {
        name: String
    ,   list: List String
    }

init : Model
init = 
    {
        name = "Username"
    ,   list = []
    }


-- UPDATE

type Msg = OnChange String | OnSubmit

update : Msg -> Model -> Model
update msg model =
  case msg of
    OnChange message -> {
        name = message,
        list = model.list
        }

    OnSubmit -> {
        name = "",
        list = model.list ++ [model.name]
        }


-- VIEW

view : Model -> Html Msg
view model =
  form [ ]
    [ input [ onInput OnChange, value model.name ] [  ]
    , button [ onClick OnSubmit, type_ "button" ] [text "Add user"] 
    , model.list
       |> List.map (\l -> li [] [ text l ])
       |> ul []
    ]