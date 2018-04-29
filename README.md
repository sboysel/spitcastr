
# spitcastr

[![Travis](https://img.shields.io/travis/sboysel/spitcastr.svg?style=flat-square)](https://travis-ci.org/sboysel/spitcastr)
[![Codecov](https://img.shields.io/codecov/c/github/sboysel/spitcastr.svg?style=flat-square)](https://codecov.io/github/sboysel/spitcastr)
[![GitHub
license](https://img.shields.io/github/license/sboysel/spitcastr.svg?style=flat-square)](https://github.com/sboysel/spitcastr/blob/master/LICENSE)

An `R` client for the [Spitcast Surf Forecast
API](http://www.spitcast.com/api/docs/).

## Usage
Install `spitcastr`

```r
# install.packages("devtools")
devtools::install_github("sboysel/spitcastr")
library(spitcastr)
```
### County
List the spots in a county

```r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
county(item = "spots", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> # A tibble: 28 x 5
#>    county        latitude longitude spot_id spot_name       
#>  * <chr>            <dbl>     <dbl>   <int> <chr>           
#>  1 Orange County     33.7     -118.     222 Seal Beach Pier 
#>  2 Orange County     33.7     -118.     602 Surfside Jetty  
#>  3 Orange County     33.7     -118.     603 Anderson St     
#>  4 Orange County     33.7     -118.     604 Bolsa Chica     
#>  5 Orange County     33.7     -118.     220 Goldenwest      
#>  6 Orange County     33.7     -118.     605 17th Street     
#>  7 Orange County     33.7     -118.     221 Huntington Pier 
#>  8 Orange County     33.6     -118.     643 Huntington Beach
#>  9 Orange County     33.6     -118.     219 56th Street     
#> 10 Orange County     33.6     -118.     607 40th Street     
#> # ... with 18 more rows
```
List swell forecasts for a particular county

```r
county(item = "swell", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> # A tibble: 25 x 24
#>    date     day   gmt     hour    hst name   `0.dir` `0.hs` `0.tp` `1.dir`
#>  * <chr>    <chr> <chr>   <chr> <dbl> <chr>    <dbl>  <dbl>  <dbl>   <dbl>
#>  1 Saturda… Sat   2018-4… 12AM   2.01 Orang…     109   1.74    7.4     359
#>  2 Saturda… Sat   2018-4… 1AM    2.04 Orang…     109   1.79    7.5       1
#>  3 Saturda… Sat   2018-4… 2AM    2.07 Orang…     109   1.84    7.8       1
#>  4 Saturda… Sat   2018-4… 3AM    2.09 Orang…     109   1.87    7.9       1
#>  5 Saturda… Sat   2018-4… 4AM    2.09 Orang…     109   1.87    7.9       1
#>  6 Saturda… Sat   2018-4… 5AM    2.08 Orang…     109   1.88    8         1
#>  7 Saturda… Sat   2018-4… 6AM    2.06 Orang…     108   1.86    8         1
#>  8 Saturda… Sat   2018-4… 7AM    2.03 Orang…     108   1.83    8.1       1
#>  9 Saturda… Sat   2018-4… 8AM    2    Orang…     107   1.79    8.1       1
#> 10 Saturda… Sat   2018-4… 9AM    1.97 Orang…     106   1.76    8.1       0
#> # ... with 15 more rows, and 14 more variables: `1.hs` <dbl>,
#> #   `1.tp` <dbl>, `2.dir` <dbl>, `2.hs` <dbl>, `2.tp` <dbl>,
#> #   `3.dir` <dbl>, `3.hs` <dbl>, `3.tp` <dbl>, `4.dir` <dbl>,
#> #   `4.hs` <dbl>, `4.tp` <dbl>, `5.dir` <dbl>, `5.hs` <dbl>, `5.tp` <dbl>
```
Get tide predictions for a particular county

```r
county(item = "tide", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> # A tibble: 25 x 7
#>    date                 day   gmt          hour  name     tide tide_meters
#>  * <chr>                <chr> <chr>        <chr> <chr>   <dbl>       <dbl>
#>  1 Saturday Apr 28 2018 Sat   2018-4-28 7  12AM  Orang…  2.58        0.786
#>  2 Saturday Apr 28 2018 Sat   2018-4-28 8  1AM   Orang…  1.27        0.388
#>  3 Saturday Apr 28 2018 Sat   2018-4-28 9  2AM   Orang…  0.302       0.092
#>  4 Saturday Apr 28 2018 Sat   2018-4-28 10 3AM   Orang… -0.108      -0.033
#>  5 Saturday Apr 28 2018 Sat   2018-4-28 11 4AM   Orang…  0.128       0.039
#>  6 Saturday Apr 28 2018 Sat   2018-4-28 12 5AM   Orang…  0.935       0.285
#>  7 Saturday Apr 28 2018 Sat   2018-4-28 13 6AM   Orang…  2.10        0.639
#>  8 Saturday Apr 28 2018 Sat   2018-4-28 14 7AM   Orang…  3.30        1.00 
#>  9 Saturday Apr 28 2018 Sat   2018-4-28 15 8AM   Orang…  4.22        1.28 
#> 10 Saturday Apr 28 2018 Sat   2018-4-28 16 9AM   Orang…  4.61        1.41 
#> # ... with 15 more rows
```
Get water temperature for a particular county

```r
county(item = "temp", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> # A tibble: 1 x 6
#>   buoy_id celcius county        fahrenheit recorded         wetsuit    
#>     <int>   <dbl> <chr>              <int> <chr>            <chr>      
#> 1   46242    16.4 Orange County         61 Y2018 M4 D28 H18 3mm Wetsuit
```
Get wind speed predictions for a particular county

```r
county(item = "wind", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> # A tibble: 25 x 9
#>    date  day   direction_degre… direction_text gmt   hour  name  speed_kts
#>  * <chr> <chr>            <int> <chr>          <chr> <chr> <chr>     <int>
#>  1 Satu… Sat                240 SW             2018… 12AM  Oran…         5
#>  2 Satu… Sat                240 SW             2018… 1AM   Oran…         5
#>  3 Satu… Sat                240 SW             2018… 2AM   Oran…         5
#>  4 Satu… Sat                240 SW             2018… 3AM   Oran…         4
#>  5 Satu… Sat                240 SW             2018… 4AM   Oran…         3
#>  6 Satu… Sat                130 SE             2018… 5AM   Oran…         3
#>  7 Satu… Sat                130 SE             2018… 6AM   Oran…         3
#>  8 Satu… Sat                130 SE             2018… 7AM   Oran…         3
#>  9 Satu… Sat                130 SE             2018… 8AM   Oran…         3
#> 10 Satu… Sat                130 SE             2018… 9AM   Oran…         4
#> # ... with 15 more rows, and 1 more variable: speed_mph <dbl>
```
### Spots
List all spots

```r
spot(item = "all") %>%
  dplyr::tbl_df() %>%
  dplyr::filter(county_name == "Santa Barbara") 
#> # A tibble: 22 x 5
#>    county_name   latitude longitude spot_id spot_name             
#>    <chr>            <dbl>     <dbl>   <int> <chr>                 
#>  1 Santa Barbara     35.0     -121.     711 Santa Maria Rivermouth
#>  2 Santa Barbara     34.7     -121.     712 Surf Beach            
#>  3 Santa Barbara     34.5     -121.     185 Jalama                
#>  4 Santa Barbara     34.5     -120.     713 Tajiguas              
#>  5 Santa Barbara     34.5     -120.     620 Refugio               
#>  6 Santa Barbara     34.5     -120.     714 Beavers               
#>  7 Santa Barbara     34.5     -120.     183 El Capitan            
#>  8 Santa Barbara     34.4     -120.     182 Sands                 
#>  9 Santa Barbara     34.4     -120.     181 Devereux              
#> 10 Santa Barbara     34.4     -120.     715 Pescaderos            
#> # ... with 12 more rows
```
Get the forecast for a specific spot

```r
spot(item = "forecast", spot_id = 183) %>%
  dplyr::tbl_df()
#> # A tibble: 25 x 17
#>    date  day   gmt   hour  latitude  live longitude shape shape_full  size
#>  * <chr> <chr> <chr> <chr>    <dbl> <int>     <dbl> <chr> <chr>      <int>
#>  1 Satu… Sat   2018… 12AM      34.5     0     -120. pf    Poor-Fair      0
#>  2 Satu… Sat   2018… 1AM       34.5     0     -120. pf    Poor-Fair      0
#>  3 Satu… Sat   2018… 2AM       34.5     0     -120. pf    Poor-Fair      0
#>  4 Satu… Sat   2018… 3AM       34.5     0     -120. pf    Poor-Fair      0
#>  5 Satu… Sat   2018… 4AM       34.5     0     -120. pf    Poor-Fair      0
#>  6 Satu… Sat   2018… 5AM       34.5     0     -120. pf    Poor-Fair      0
#>  7 Satu… Sat   2018… 6AM       34.5     0     -120. pf    Poor-Fair      0
#>  8 Satu… Sat   2018… 7AM       34.5     0     -120. pf    Poor-Fair      0
#>  9 Satu… Sat   2018… 8AM       34.5     0     -120. pf    Poor-Fair      0
#> 10 Satu… Sat   2018… 9AM       34.5     0     -120. pf    Poor-Fair      0
#> # ... with 15 more rows, and 7 more variables: size_ft <dbl>,
#> #   spot_id <int>, spot_name <chr>, warnings <list>,
#> #   shape_detail.swell <chr>, shape_detail.tide <chr>,
#> #   shape_detail.wind <chr>
```
List spot near your location

```r
spot(item = "nearby") %>%
  dplyr::tbl_df()
#> # A tibble: 20 x 7
#>    county_id progress spot_id spot_id_char   spot_name  longitude latitude
#>  *     <int>    <int>   <int> <chr>          <chr>          <dbl>    <dbl>
#>  1         5       10     110 bolinas-bolin… Bolinas        -123.     37.9
#>  2         5       10     112 fort-cronkhit… Fort Cron…     -123.     37.8
#>  3         6       46     113 fort-point-sa… Fort Point     -122.     37.8
#>  4         6       24     649 eagles-point-… Eagles Po…     -122.     37.8
#>  5         6       25     648 deadmans-san-… Deadmans       -122.     37.8
#>  6         6       44     697 kellys-cove-s… Ocean Bea…     -123.     37.8
#>  7         6      100     114 north-ocean-b… Ocean Bea…     -123.     37.8
#>  8         6      100     117 south-ocean-b… Ocean Bea…     -123.     37.8
#>  9         7      100     120 linda-mar-pac… Linda Mar      -123.     37.6
#> 10         7       27     121 montara-monta… Montara        -123.     37.6
#> 11         7      100     122 mavericks-hal… Mavericks      -123.     37.5
#> 12         7       45     123 princeton-jet… Princeton…     -122.     37.5
#> 13         7       22     126 pomponio-stat… Pomponio …     -122.     37.3
#> 14         7       26     118 ano-nuevo-pes… Ano Nuevo      -122.     37.1
#> 15         1       21     593 county-line-d… County Li…     -122.     37.1
#> 16         1       48     129 waddell-creek… Waddell C…     -122.     37.1
#> 17         1       16     600 waddell-reefs… Waddell R…     -122.     37.1
#> 18         1       29     128 scotts-creek-… Scotts Cr…     -122.     37.0
#> 19         1       19     133 davenport-lan… Davenport…     -122.     37.0
#> 20         1       92     131 four-mile-san… Four Mile      -122.     37.0
```
List neighbors of a given spot

```r
spot(item = "neighbors", spot_id = 1, direction = "above") %>%
  dplyr::tbl_df()
#> # A tibble: 15 x 7
#>    county_id progress spot_id spot_id_char    spot_name longitude latitude
#>  *     <int>    <int>   <int> <chr>           <chr>         <dbl>    <dbl>
#>  1         1       52     130 three-mile-san… Three Mi…     -122.     37.0
#>  2         1      100       6 natural-bridge… Natural …     -122.     36.9
#>  3         1       57     146 stockton-avenu… Stockton…     -122.     36.9
#>  4         1       45     145 swift-street-s… Swift St…     -122.     36.9
#>  5         1       64      10 getchell-santa… Getchell      -122.     36.9
#>  6         1       32     144 mitchells-cove… Mitchell…     -122.     37.0
#>  7         1      100       2 steamer-lane-s… Steamer …     -122.     37.0
#>  8         1      100       3 cowells-santa-… Cowells       -122.     37.0
#>  9         1       10     143 the-rivermouth… The Rive…     -122.     37.0
#> 10         1       30       9 blacks-santa-c… Blacks        -122.     37.0
#> 11         1       30       8 santa-marias-s… Santa Ma…     -122.     37.0
#> 12         1       54       7 26th-ave-santa… 26th Ave…     -122.     37.0
#> 13         1       31     138 little-windans… Little W…     -122.     37.0
#> 14         1       61     137 rockview-santa… Rockview      -122.     37.0
#> 15         1       87       5 sewer-peak-san… Sewer Pe…     -122.     37.0
```
Search for a spot with a sequence of parameters 

```r
spot(item = "search", size_min = 3, size_max = 8, shape_min = 1) %>%
  dplyr::tbl_df()
#> # A tibble: 25 x 18
#>    `_id` coast_order field_data_count score spot_id spot_id_char spot_name
#>  * <chr> <chr>                  <int> <dbl>   <int> <chr>        <chr>    
#>  1 717-… 12-15                      2  4.70     717 silver-stra… Silver S…
#>  2 106-… 04-06                      1  2.13     106 russian-riv… Russian …
#>  3 611-… 14-24                      2  1.96     611 thalia-lagu… Thalia   
#>  4 152-… 09-10                     14  1.85     152 sand-dollar… Sand Dol…
#>  5 215-… 14-25                      1  1.84     215 brooks-stre… Brooks S…
#>  6 743-… 14-26                      2  1.82     743 agate-lagun… Agate    
#>  7 229-… 15-27                    527  1.66     229 blacks-beac… Blacks B…
#>  8 209-… 14-38                    112  1.52     209 cottons-poi… Cottons …
#>  9 801-… 06-08                      3  1.49     801 sloat-ocean… Ocean Be…
#> 10 238-… 15-01                    762  1.48     238 oceanside-h… Oceansid…
#> # ... with 15 more rows, and 11 more variables: timestamp <int>,
#> #   warnings <int>, average.shape <dbl>, average.size <dbl>,
#> #   average.size_max <dbl>, average.size_min <dbl>, date_local.dd <int>,
#> #   date_local.mm <int>, date_local.yy <int>, longitude <dbl>,
#> #   latitude <dbl>
```
List top spots

```r
spot(item = "top") %>%
  dplyr::tbl_df()
#> # A tibble: 5 x 5
#>   avg_max_size avg_min_size shape spot_id spot_name       
#> *        <int>        <int> <chr>   <int> <chr>           
#> 1            6            5 Fair      229 Blacks Beach    
#> 2            5            5 Fair      209 Cottons Point   
#> 3            5            5 Fair      238 Oceanside Harbor
#> 4            5            5 Fair      594 Oceanside Pier  
#> 5            5            4 Fair      234 Swamis
```

## Resources

* [Spitcast Surf Forecast API Documentation](http://www.spitcast.com/api/docs/)

Be sure to checkout [Spitcast](http://www.spitcast.com/) and read the ['fine
print'](http://www.spitcast.com/api/docs/):

> Public distribution of Spitcast API content must acknowledge Spitcast as
> the content source, and provide a link to Spitcast.com.

> The Spitcast API is available for non-commercial use. Commercial use is 
> possible by prior arrangement.

> The Spitcast API is available for low request volume use. Please cache API 
> responses. Please also make API requests to api.spitcast.com, and NOT to 
> www.spitcast.com.

> The Spitcast API is experimental and is currently offered on an ad hoc basis 
> with no guarantee of uptime or availability of continued service. We reserve 
> the right to disable access to external applications at any time.

