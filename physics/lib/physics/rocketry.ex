defmodule Converter do
	def to_km(val) do
		val / 1000
	end

	def to_nearest_tenth(val) do
		Float.ceil val, 1
	end

	def to_light_seconds({:miles, miles}) do
		(miles * 5.36819e-6) |> round_down
	end

	def to_light_seconds({:meters, meters}) do
		(meters * 3.335638620368e-9) |> round_down
	end

	def round_down(val) when is_float(val), do: trunc(val)
end

defmodule Physics.Planet do

	defstruct [
		name: "Earth",
		radius_m: 6.371e6,
		mass_kg: 5.972e24
	]	

end


defmodule Physics.Rocketry do
	
	def escape_velocity(:earth) do
		%{mass: 5.972e24, radius_m: 6.371e6}
		|> escape_velocity
	end

	def escape_velocity(:mars) do
		%{mass: 6.39e23, radius_m: 3.389278e6}
		|> escape_velocity
	end

	def escape_velocity(:moon) do
		%{mass: 7.35e22, radius_m: 1.7375e6}
		|> escape_velocity
	end	

	def escape_velocity(planet) when is_map(planet) do
		planet
		|> calculate_escape
		|> Converter.to_km
		|> Converter.to_nearest_tenth		
	end

	defp calculate_escape(%{mass: mass, radius_m: radius_m}) do
		newtons_constant = 6.67e-11
		2 * newtons_constant * mass/radius_m
		|> :math.sqrt
	end

end