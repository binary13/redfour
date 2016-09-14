defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:earth)
    # |> IO.inspect
    assert ev == 11.2
  end

  test "escape velocity of mars is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:mars)
    # |> IO.inspect
    assert ev == 5.1
  end

  test "escape velocity of the moon is correct: " do
  	ev = Physics.Rocketry.escape_velocity(:moon)
    # |> IO.inspect
    assert ev == 2.4
  end

  test "Converting miles to to_light_seconds works: " do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00537
  end

  test "Orbital radius for earth at 100km: " do
    orb_radius = Physics.rocketry.orbital_radius(100)
    assert orb_radius == 6470000
  end

  test "Orbital speed for earth at 100km: " do
    orbital_spd = 
  end
  
  test "Orbital acceleration for earth at 100km: " do
    orbital_acc = Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.515619587729839
  end

  test "Orbital term for 6500km above earth: " do
    term = Physics.Rocketry.orbital_term(6500)
    |> IO.inspect
    assert (term > 4) && (term < 5) #crap fix this!
  end

end
