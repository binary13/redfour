defmodule Physics.Rocketry do

	import Converter
	import Calcs
	import Physics.Laws
	import Planets

	def escape_velocity(:earth), do: earth |> escape_velocity
	def escape_velocity(:moon), do:	moon	|> escape_velocity
	def escape_velocity(:mars), do:	mars	|> escape_velocity

	def escape_velocity(planet) when is_map(planet) do
		planet
		|> calculate_escape
		|> meters_to_km
		|> to_nearest_tenth		
	end

	defp calculate_escape(%{mass: mass, radius_m: radius_m}) do
		
		2 * newtons_constant * mass/radius_m
		|> square_root
	end

end