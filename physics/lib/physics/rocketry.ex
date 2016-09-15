defmodule Physics.Rocketry do

	import Converter
	import Calcs
	import Physics.Laws
	import Planets

	def escape_velocity(:earth), do: earth  |> escape_velocity
	def escape_velocity(:moon), do:	moon	|> escape_velocity
	def escape_velocity(:mars), do:	mars	|> escape_velocity

	# Returns escape velocity in km per hour for (planet map)
	def escape_velocity(planet) when is_map(planet) do
		planet
		|> calculate_escape
		|> meters_to_km
		|> to_nearest_tenth		
	end

	# Helper function to calculate escape velocity in meters per hour
	defp calculate_escape(%{mass: mass, radius_m: radius_m}) do
		2 * newtons_constant * mass / radius_m
		|> square_root
	end

	# Returns speed in meters per second
	def orbital_speed(height) do
		newtons_constant * earth.mass / orbital_radius(height)
		|> square_root
	end

	# Returns acceleration due to gravity in meters per second per second
	def orbital_acceleration(height) do
		(orbital_speed(height) |> squared) / orbital_radius(height)
	end

	# Returns time required to complete one orbit at (height meters) in hours
	def orbital_term(height) do
		4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (
			newtons_constant * earth.mass)
			|> square_root
			|> seconds_to_hours
	end

	# Returns orbital radius in meters
	def orbital_radius(height) do
		earth.radius_m + (height |> km_to_meters)
	end

	# Returns orbital height in km required to make one orbit in (time hours).
	def orbital_height(time) do
		t_sec = time * 3600
		radius = (newtons_constant * earth.mass * (t_sec |> squared)) / (4 * (:math.pi |> squared))
		|> cube_root
		|> - earth.radius_m
		|> meters_to_km
	end
end