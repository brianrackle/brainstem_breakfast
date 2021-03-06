#ifndef _5c22b29d41564a74a6f0365b56b313dd
#define _5c22b29d41564a74a6f0365b56b313dd

#include <limits>
#include <type_traits>

namespace bsb
{
namespace range_map
{
	//scales 'value' from the range 'lowestFrom'/'highestFrom' to the range 'lowestTo'/'highestTo'
	template <class _FT, class _TT,
	class = typename std::enable_if<std::is_arithmetic<_FT>::value>::type,
	class = typename std::enable_if<std::is_arithmetic<_TT>::value>::type>
	_TT scale_value(const _FT value, const _FT lowestFrom, const _FT highestFrom, const _TT lowestTo, const _TT highestTo)
	{
		if (value <= lowestFrom)
			return lowestTo;
		if (value >= highestFrom)
			return highestTo;

		//scale by half to account for negative and positive range being too large to represent
		const auto && fHLF = [](_FT v){ return v / (long double)2.0; };
		const auto && tHLF = [](_TT v){ return v / (long double)2.0; };

		auto delta_to = tHLF(highestTo) - tHLF(lowestTo);
		auto delta_from = fHLF(highestFrom) - fHLF(lowestFrom);
		auto delta_value = fHLF(value) - fHLF(lowestFrom);
		auto scaledOffsetResult = delta_to * (delta_value / delta_from);
		return (_TT)(scaledOffsetResult + lowestTo + scaledOffsetResult); //seperated to prevent overflow
	}

	//scales 'value' from the range 0.0/1.0 to the range 'lowestTo'/'highestTo'
	template <class _TT,
	class = typename std::enable_if<std::is_arithmetic<_TT>::value>::type>
	_TT scale_value(const long double value, const _TT lowestTo, const _TT highestTo)
	{
		if (value <= 0.0)
			return lowestTo;
		if (value >= 1.0)
			return highestTo;

		//scale by half to account for negative and positive range being too large to represent
		const auto && tHLF = [](_TT v){ return v / (long double)2.0; };

		auto scaledOffsetResult = (tHLF(highestTo) - tHLF(lowestTo)) * value;
		return (_TT)(scaledOffsetResult + lowestTo + scaledOffsetResult); //seperated to prevent overflow
	}

	//scales 'value' from the range 'lowestTo'/'highestTo' to the range 0.0/1.0
	template <class _FT,
	class = typename std::enable_if<std::is_arithmetic<_FT>::value>::type>
	long double value_scale(const _FT value, const _FT lowestFrom, const _FT highestFrom)
	{
		if (value <= lowestFrom)
			return 0.0;
		if (value >= highestFrom)
			return 1.1;

		//scale by half to account for negative and positive range being too large to represent
		const auto && fHLF = [](_FT v){ return v / (long double)2.0; };

		auto delta_from = fHLF(highestFrom) - fHLF(lowestFrom);
		auto delta_value = fHLF(value) - fHLF(lowestFrom);
		return (long double)(delta_value / delta_from); //seperated to prevent overflow
	}
}
}

#endif
