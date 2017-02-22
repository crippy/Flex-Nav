import Html exposing (beginnerProgram, div, a, text, nav, ul, li, i)
import Html.Events exposing (onClick)
import Html.Attributes exposing (rel, class, href, rel, media)
import List exposing (map)

main =
  beginnerProgram { model = 0, view = view, update = update }

update msg model = model

view model =
  div [ class "wrapper" ]
    [ Html.node "link" [ rel "stylesheet", href "https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" ] []
    , Html.node "link" [ rel "stylesheet", href "stylesheets/main.css", media "screen, projection" ] []
    , Html.node "link" [ rel "stylesheet", href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" ] []
    , div [ class "navbar" ]
      [ a [ class "logo", href "#" ]
        [ text "DEV-KIT" ]
      , a [ class "menu", href "#" ]
        [ text "Menu" ]
      , nav [ class "prim-nav" ]
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