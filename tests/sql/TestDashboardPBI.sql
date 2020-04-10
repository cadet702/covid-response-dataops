SELECT	L.FIPS
        , L.county_name
        , L.state_name
        , L.est_population
        , H.Hospital_name
        , H.staffed_beds_count
        , H.Icu_beds_count
        , H.bed_utilization
        , H.avg_ventilator_usage AS Ventilator_usage
		, I.incident_date
        , I.case_count
        , I.death_count

FROM location L
	LEFT JOIN hospital H ON L.FIPS = H.FIPS
    LEFT JOIN incident I ON L.FIPS = I.FIPS

WHERE	L.state_name = 'Colorado'
AND		I.case_count > 0;
