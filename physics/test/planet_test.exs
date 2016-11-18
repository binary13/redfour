defmodule PlanetTest do

    use ExUnit.Case

    setup do
        planets = [
            %{name: "Mercury", type: :rocky, ev: 4.3},
            %{name: "Venus", type: :rocky, ev: 10.4},
            %{name: "Earth", type: :rocky, ev: 11.2},
            %{name: "Mars", type: :rocky, ev: 5.0},
            %{name: "Jupiter", type: :gaseous, ev: 59.5},
            %{name: "Saturn", type: :gaseous, ev: 35.5},
            %{name: "Uranus", type: :gaseous, ev: 21.3},
            %{name: "Neptune", type: :gaseous, ev: 23.5}
        ]
        {:ok, planets: planets}
    end
    
    test "Accounting for Venus blowing up", %{planets: planets} do
        venus = Enum.at(planets, 1)
        venus = %{venus | ev: 7.2}
        assert venus.ev == 7.2
    end

end