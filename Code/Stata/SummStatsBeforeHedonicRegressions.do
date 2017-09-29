********************************************************************************
*********************** SUMMARY STATS BEFORE HEDONIC REGRESSIONS ***************
********************************************************************************
use "Y:\agrajg\Research\Data\temp\HedonicRegressionData.dta", clear
********************************************************************************
preserve
collapse 	(count) numproperties = propertyid ///
			(sum) numprnextpd = matchedtonextpd ///
			(mean) mean_ltypedum1 = ltypedum1 ///
			(mean) mean_ltypedum2 = ltypedum2 ///
			(mean) mean_ltypedum3 = ltypedum3 ///
			(mean) mean_ltypedum4 = ltypedum4 ///
			(mean) mean_bedrooms = bedrooms ///
			(min) min_bedrooms =bedrooms ///
			(p1) p1_bedrooms =bedrooms ///
			(p5) p5_bedrooms =bedrooms ///
			(p10) p10_bedrooms =bedrooms ///
			(p25) p25_bedrooms =bedrooms ///
			(p50) p50_bedrooms =bedrooms ///
			(p75) p75_bedrooms =bedrooms ///
			(p90) p90_bedrooms =bedrooms ///
			(p95) p95_bedrooms =bedrooms ///
			(p99) p99_bedrooms =bedrooms ///
			(max) max_bedrooms =bedrooms ///
			(mean) mean_bathrooms = bathrooms ///
			(min) min_bathrooms =bathrooms ///
			(p1) p1_bathrooms =bathrooms ///
			(p5) p5_bathrooms =bathrooms ///
			(p10) p10_bathrooms =bathrooms ///
			(p25) p25_bathrooms =bathrooms ///
			(p50) p50_bathrooms =bathrooms ///
			(p75) p75_bathrooms =bathrooms ///
			(p90) p90_bathrooms =bathrooms ///
			(p95) p95_bathrooms =bathrooms ///
			(p99) p99_bathrooms =bathrooms ///
			(max) max_bathrooms =bathrooms ///
			, by(date)

save "Y:\agrajg\Research\Output\SumStatsbyDatePrimaryvar1.dta", replace			
restore
	
