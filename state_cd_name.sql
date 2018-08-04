
-- Proper Case

SELECT        'ALL' AS pr_alpha_state_cd, 1 AS Sid, StateName = 'ALL'
UNION
SELECT DISTINCT pr_alpha_state_cd, 2 AS sid
,StateName = CASE 
WHEN pr_alpha_state_cd = 'AK' THEN 'Alaska'
WHEN pr_alpha_state_cd = 'AL' THEN 'Alabama'
WHEN pr_alpha_state_cd = 'AR' THEN 'Arkansas'
WHEN pr_alpha_state_cd = 'AZ' THEN 'Arizona'
WHEN pr_alpha_state_cd = 'CA' THEN 'California '
WHEN pr_alpha_state_cd = 'CO' THEN 'Colorado'
WHEN pr_alpha_state_cd = 'CT' THEN 'Connecticut'
WHEN pr_alpha_state_cd = 'DC' THEN 'District Of Columbia'
WHEN pr_alpha_state_cd = 'DE' THEN 'Delaware'
WHEN pr_alpha_state_cd = 'FL' THEN 'Florida'
WHEN pr_alpha_state_cd = 'GA' THEN 'Georgia'
WHEN pr_alpha_state_cd = 'HI' THEN 'Hawaii'
WHEN pr_alpha_state_cd = 'IA' THEN 'Iowa'
WHEN pr_alpha_state_cd = 'ID' THEN 'Idaho'
WHEN pr_alpha_state_cd = 'IL' THEN 'Illinois'
WHEN pr_alpha_state_cd = 'IN' THEN 'Indiana'
WHEN pr_alpha_state_cd = 'KS' THEN 'Kansas'
WHEN pr_alpha_state_cd = 'KY' THEN 'Kentucky'
WHEN pr_alpha_state_cd = 'LA' THEN 'Louisiana'
WHEN pr_alpha_state_cd = 'MA' THEN 'Massachussetts'
WHEN pr_alpha_state_cd = 'MD' THEN 'Maryland'
WHEN pr_alpha_state_cd = 'ME' THEN 'Maine'
WHEN pr_alpha_state_cd = 'MI' THEN 'Michigan'
WHEN pr_alpha_state_cd = 'MN' THEN 'Minnesota'
WHEN pr_alpha_state_cd = 'MO' THEN 'Missouri'
WHEN pr_alpha_state_cd = 'MS' THEN 'Mississippi'
WHEN pr_alpha_state_cd = 'MT' THEN 'Montana'
WHEN pr_alpha_state_cd = 'NC' THEN 'North Carolina'
WHEN pr_alpha_state_cd = 'ND' THEN 'North Dakota'
WHEN pr_alpha_state_cd = 'NE' THEN 'Nebraska'
WHEN pr_alpha_state_cd = 'NH' THEN 'New Hampshire'
WHEN pr_alpha_state_cd = 'NJ' THEN 'New Jersey'
WHEN pr_alpha_state_cd = 'NM' THEN 'New Mexico'
WHEN pr_alpha_state_cd = 'NV' THEN 'Nevada'
WHEN pr_alpha_state_cd = 'NY' THEN 'New York'
WHEN pr_alpha_state_cd = 'OH' THEN 'Ohio'
WHEN pr_alpha_state_cd = 'OK' THEN 'Oklahoma'
WHEN pr_alpha_state_cd = 'OR' THEN 'Oregon'
WHEN pr_alpha_state_cd = 'PA' THEN 'Pennsylvania'
WHEN pr_alpha_state_cd = 'PR' THEN 'Puerto Rico'
WHEN pr_alpha_state_cd = 'RI' THEN 'Rhode Island'
WHEN pr_alpha_state_cd = 'SC' THEN 'South Carolina'
WHEN pr_alpha_state_cd = 'SD' THEN 'South Dakota'
WHEN pr_alpha_state_cd = 'TN' THEN 'Tennessee'
WHEN pr_alpha_state_cd = 'TX' THEN 'Texas'
WHEN pr_alpha_state_cd = 'UT' THEN 'Utah'
WHEN pr_alpha_state_cd = 'VA' THEN 'Virginia'
WHEN pr_alpha_state_cd = 'VT' THEN 'Vermont'
WHEN pr_alpha_state_cd = 'WA' THEN 'Washington'
WHEN pr_alpha_state_cd = 'WI' THEN 'Wisconsin'
WHEN pr_alpha_state_cd = 'WV' THEN 'West Virginia'
WHEN pr_alpha_state_cd = 'WY' THEN 'Wyoming'
END
FROM            property
WHERE        (pr_alpha_state_cd IS NOT NULL) and pr_alpha_state_cd <> 'NA'
ORDER BY sid, pr_alpha_state_cd


/*   UPPERCASE

SELECT        'ALL' AS pr_alpha_state_cd, 1 AS Sid, 'ALL' AS StateName
UNION
SELECT DISTINCT 
pr_alpha_state_cd, 2 AS sid, 
CASE WHEN pr_alpha_state_cd = 'AK' THEN 'ALASKA' 
WHEN pr_alpha_state_cd = 'AL' THEN 'ALABAMA' 
WHEN pr_alpha_state_cd = 'AR' THEN 'ARKANSAS' 
WHEN pr_alpha_state_cd = 'AZ' THEN 'ARIZONA' 
WHEN pr_alpha_state_cd = 'CA' THEN 'CALIFORNIA ' 
WHEN pr_alpha_state_cd = 'CO' THEN 'COLORADO' 
WHEN pr_alpha_state_cd = 'CT' THEN 'CONNECTICUT' 
WHEN pr_alpha_state_cd = 'DC' THEN 'DISTRICT OF COLUMBIA' 
WHEN pr_alpha_state_cd = 'DE' THEN 'DELAWARE' 
WHEN pr_alpha_state_cd = 'FL' THEN 'FLORIDA' 
WHEN pr_alpha_state_cd = 'GA' THEN 'GEORGIA' 
WHEN pr_alpha_state_cd = 'HI' THEN 'HAWAII' 
WHEN pr_alpha_state_cd = 'IA' THEN 'IOWA' 
WHEN pr_alpha_state_cd = 'ID' THEN 'IDAHO' 
WHEN pr_alpha_state_cd = 'IL' THEN 'ILLINOIS'
WHEN pr_alpha_state_cd = 'IN' THEN 'INDIANA' 
WHEN pr_alpha_state_cd = 'KS' THEN 'KANSAS' 
WHEN pr_alpha_state_cd = 'KY' THEN 'KENTUCKY' 
WHEN pr_alpha_state_cd = 'LA' THEN 'LOUISIANA' 
WHEN pr_alpha_state_cd = 'MA' THEN 'MASSACHUSETTS'
WHEN pr_alpha_state_cd = 'MD' THEN 'MARYLAND' 
WHEN pr_alpha_state_cd = 'ME' THEN 'MAINE' 
WHEN pr_alpha_state_cd = 'MI' THEN 'MICHIGAN' 
WHEN pr_alpha_state_cd = 'MN' THEN 'MINNESOTA' 
WHEN pr_alpha_state_cd = 'MO' THEN 'MISSOURI' 
WHEN pr_alpha_state_cd = 'MS' THEN 'MISSISSIPPI' 
WHEN pr_alpha_state_cd = 'MT' THEN 'MONTANA' 
WHEN pr_alpha_state_cd = 'NC' THEN 'NORTH CAROLINA' 
WHEN pr_alpha_state_cd = 'ND' THEN 'NORTH DAKOTA' 
WHEN pr_alpha_state_cd = 'NE' THEN 'NEBRASKA' 
WHEN pr_alpha_state_cd = 'NH' THEN 'NEW HAMPSHIRE' 
WHEN pr_alpha_state_cd = 'NJ' THEN 'NEW JERSEY' 
WHEN pr_alpha_state_cd = 'NM' THEN 'NEW MEXICO' 
WHEN pr_alpha_state_cd = 'NV' THEN 'NEVADA' 
WHEN pr_alpha_state_cd = 'NY' THEN 'NEW YORK' 
WHEN pr_alpha_state_cd = 'OH' THEN 'OHIO'
WHEN pr_alpha_state_cd = 'OK' THEN 'OKLAHOMA' 
WHEN pr_alpha_state_cd = 'OR' THEN 'OREGON' 
WHEN pr_alpha_state_cd = 'PA' THEN 'PENNSYLVANIA' 
WHEN pr_alpha_state_cd = 'PR' THEN 'PUERTO RICO' 
WHEN pr_alpha_state_cd = 'RI' THEN 'RHODE ISLAND' 
WHEN pr_alpha_state_cd = 'SC' THEN 'SOUTH CAROLINA' 
WHEN pr_alpha_state_cd = 'SD' THEN 'SOUTH DAKOTA' 
WHEN pr_alpha_state_cd = 'TN' THEN 'TENNESSEE' 
WHEN pr_alpha_state_cd = 'TX' THEN 'TEXAS' 
WHEN pr_alpha_state_cd = 'UT' THEN 'UTAH' 
WHEN pr_alpha_state_cd = 'VA' THEN 'VIRGINIA ' 
WHEN pr_alpha_state_cd = 'VT' THEN 'VERMONT' 
WHEN pr_alpha_state_cd = 'WA' THEN 'WASHINGTON'
WHEN pr_alpha_state_cd = 'WI' THEN 'WISCONSIN' 
WHEN pr_alpha_state_cd = 'WV' THEN 'WEST VIRGINIA'
WHEN pr_alpha_state_cd = 'WY' THEN 'WYOMING' END
AS StateName
FROM            property
WHERE        (pr_alpha_state_cd IS NOT NULL) AND (pr_alpha_state_cd <> 'NA')
ORDER BY sid, pr_alpha_state_cd
*/

