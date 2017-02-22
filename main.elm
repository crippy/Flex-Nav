port module Main exposing (main)

import Html exposing (beginnerProgram, div, a, text, nav, ul, li, i)
import Html.Events exposing (onClick, on, targetValue)
import Html.Attributes exposing (rel, class, href, rel, media, classList)
import List exposing (map)
import Json.Decode as Json

main = Html.program
  { init = initModel ! []
  , update = update
  , view = view
  , subscriptions = subscriptions
  }

-- model
type alias Model =
  { menu : Bool
  }

initModel : Model
initModel =
  { menu = False
  }

-- ports
subscriptions _ =
  bodyClick BodyMenuClick

port bodyClick : (Bool -> msg) -> Sub msg

-- update
update msg model =
  case msg of
    MenuOpen -> if model.menu then
                  { model | menu = False } ! []
                else
                  { model | menu = True } ! []
    MenuClose -> { model | menu = False } ! []
    BodyMenuClick isMenu -> if isMenu then
                              model ! []
                            else
                              { model | menu = False } ! []
    NoOp -> model ! []

type MenuActions = NoOp | MenuOpen | MenuClose | BodyMenuClick Bool

-- view
view model =
  div [ class "wrapper"]
    [ div [ class "navbar" ]
      [ a [ class "logo", href "#" ]
        [ text "DEV-KIT" ]
      , a [ class "menu", onClick MenuOpen]
        [ text "Menu" ]
      , nav [ classList
              [ ("prim-nav", True)
              , ("open", model.menu)
              ]
            ]
        [ ul [] (map linkToLi links ++ socialLinks)
        ]
      ]
    ]

-- Stuff for view
type alias Link =
  { href : String
  , text : String
  }

links =
  [ { href = "#", text = "Home" }
  , { href = "#", text = "About" }
  , { href = "#", text = "Pricing" }
  , { href = "#", text = "Partners" }
  , { href = "#", text = "Articles" }
  , { href = "#", text = "Contact" }
  ]

linkToLi : Link -> Html.Html msg
linkToLi link =
  li []
  [ a [ href link.href ]
    [ text link.text ]
  ]

socialLinks =
  [ li [ class "social" ]
    [ a [ href "#" ]
      [ i [ class "fa fa-facebook" ]
        []
      ]
    ]
  , li [ class "social" ]
    [ a [ href "#" ]
      [ i [ class "fa fa-twitter" ]
        []
      ]
    ]
  , li [ class "social" ]
    [ a [ href "#" ]
      [ i [ class "fa fa-instagram" ]
        []
      ]
    ]
  , li [ class "social" ]
    [ a [ href "#" ]
      [ i [ class "fa fa-pinterest" ]
        []
      ]
    ]
  ]