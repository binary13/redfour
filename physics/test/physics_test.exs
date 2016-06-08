defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of planet x is correct: " do
    ev = %{mass: 4.0e22, radius_m: 6.21e6}
    |> Physics.Rocketry.escape_velocity
    |> IO.inspect
    assert ev == 1.0
  end
  
  test "escape velocity of earth is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:earth)
    |> IO.inspect
    assert ev == 11.2
  end

  test "escape velocity of mars is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:mars)
    |> IO.inspect
    assert ev == 5.1
  end

  test "escape velocity of the moon is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:moon)
    |> IO.inspect
    assert ev == 2.4
  end

end
