defmodule Converter do
	
  	def meters_to_km(val), do: val / 1000

	def km_to_meters(val), do: val * 1000

	def seconds_to_hours(val), do: val / 3600

	def hours_to_seconds(val), do: val * 3600

	def to_light_seconds({unit, val}, precision: precision) do
		case unit do
			:miles -> from_miles(val)
			:meters -> from_meters(val)
			:feet -> from_feet(val)
			:inches -> from_inches(val)
		end
		|>round_to(precision)
	end

	defp from_miles(val), do: val * 5.36819e-6
	defp from_meters(val), do: val * 3.335638620368e-9
	defp from_feet(val), do: val * 1.016702651488166404e-9
	defp from_inches(val), do: val * 8.472522095734715723e-11

	# Created round_to header to define default precision... per compiler warning.
	def round_to(val, precision \\ 6)
	def round_to(val, precision) when is_float(val), do: Float.round(val, precision)
	def round_to(val, _precision) when is_integer(val), do: round(val)

	def to_nearest_tenth(val), do: Float.ceil val, 1
	defp round_down(val) when is_float(val), do: trunc(val)

end

