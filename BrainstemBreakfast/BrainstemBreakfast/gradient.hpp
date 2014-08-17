#pragma once
#include <cmath>
#include <limits>
#include <cstdint>

namespace bsb
{
namespace gradient
{
	class rgb
	{
	public:
		using value_type = uint8_t;
		value_type r, g, b;
	};

	//rainbow gradient
	inline rgb gradient_value(const double value)
	{
		const uint8_t regions = 6;
		auto max_rgb = std::numeric_limits<rgb::value_type>::max();
		double region_map = value * regions; //value scaled to regions
		double region;
		auto subregion_value = (rgb::value_type)(std::modf(region_map, &region) * max_rgb);
		auto region_value = (rgb::value_type)region; 

		rgb gradient{ 0, 0, 0 };
		switch (region_value)
		{
		case 0:
			gradient.r = max_rgb;
			gradient.g = subregion_value;
			gradient.b = 0;
			break;
		case 1:
			gradient.r = max_rgb - subregion_value;
			gradient.g = max_rgb;
			gradient.b = 0;
			break;
		case 2:
			gradient.r = 0;
			gradient.g = max_rgb;
			gradient.b = subregion_value;
			break;
		case 3:
			gradient.r = 0;
			gradient.g = max_rgb - subregion_value;
			gradient.b = max_rgb;
			break;
		case 4:
			gradient.r = subregion_value;
			gradient.g = 0;
			gradient.b = max_rgb;
			break;
		case 5:
			gradient.r = max_rgb;
			gradient.g = 0;
			gradient.b = max_rgb - subregion_value;
			break;
		};
		
		return gradient;
	}
}
}