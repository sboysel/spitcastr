
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
county(item = "spots", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> Source: local data frame [28 x 5]
#> 
#>           county latitude longitude spot_id        spot_name
#>            (chr)    (dbl)     (dbl)   (int)            (chr)
#> 1  Orange County 33.73772 -118.1079     222  Seal Beach Pier
#> 2  Orange County 33.72849 -118.0908     602   Surfside Jetty
#> 3  Orange County 33.72316 -118.0802     603      Anderson St
#> 4  Orange County 33.68539 -118.0404     604      Bolsa Chica
#> 5  Orange County 33.66616 -118.0190     220       Goldenwest
#> 6  Orange County 33.66395 -118.0140     605      17th Street
#> 7  Orange County 33.65521 -118.0050     221  Huntington Pier
#> 8  Orange County 33.64852 -117.9932     643 Huntington Beach
#> 9  Orange County 33.62291 -117.9488     219      56th Street
#> 10 Orange County 33.61723 -117.9388     607      40th Street
#> ..           ...      ...       ...     ...              ...
```
List swell forecasts for a particular county

```r
county(item = "swell", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> Source: local data frame [25 x 24]
#> 
#>                    date   day          gmt  hour   hst          name 0.dir
#>                   (chr) (chr)        (chr) (chr) (dbl)         (chr) (dbl)
#> 1  Thursday Jan 14 2016   Thu  2016-1-14 8  12AM  2.31 Orange County   105
#> 2  Thursday Jan 14 2016   Thu  2016-1-14 9   1AM  2.32 Orange County   105
#> 3  Thursday Jan 14 2016   Thu 2016-1-14 10   2AM  2.32 Orange County   105
#> 4  Thursday Jan 14 2016   Thu 2016-1-14 11   3AM  2.32 Orange County   105
#> 5  Thursday Jan 14 2016   Thu 2016-1-14 12   4AM  2.32 Orange County   105
#> 6  Thursday Jan 14 2016   Thu 2016-1-14 13   5AM  2.33 Orange County   105
#> 7  Thursday Jan 14 2016   Thu 2016-1-14 14   6AM  2.34 Orange County   104
#> 8  Thursday Jan 14 2016   Thu 2016-1-14 15   7AM  2.35 Orange County   104
#> 9  Thursday Jan 14 2016   Thu 2016-1-14 16   8AM  2.37 Orange County   104
#> 10 Thursday Jan 14 2016   Thu 2016-1-14 17   9AM  2.38 Orange County   104
#> ..                  ...   ...          ...   ...   ...           ...   ...
#> Variables not shown: 0.hs (dbl), 0.tp (dbl), 1.dir (dbl), 1.hs (dbl), 1.tp
#>   (dbl), 2.dir (lgl), 2.hs (lgl), 2.tp (lgl), 3.dir (lgl), 3.hs (lgl),
#>   3.tp (lgl), 4.dir (lgl), 4.hs (lgl), 4.tp (lgl), 5.dir (lgl), 5.hs
#>   (lgl), 5.tp (lgl)
```
Get tide predictions for a particular county

```r
county(item = "tide", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> Source: local data frame [25 x 7]
#> 
#>                    date   day          gmt  hour          name     tide
#>                   (chr) (chr)        (chr) (chr)         (chr)    (dbl)
#> 1  Thursday Jan 14 2016   Thu  2016-1-14 8  12AM Orange County 4.396325
#> 2  Thursday Jan 14 2016   Thu  2016-1-14 9   1AM Orange County 4.333990
#> 3  Thursday Jan 14 2016   Thu 2016-1-14 10   2AM Orange County 3.861549
#> 4  Thursday Jan 14 2016   Thu 2016-1-14 11   3AM Orange County 3.162730
#> 5  Thursday Jan 14 2016   Thu 2016-1-14 12   4AM Orange County 2.467192
#> 6  Thursday Jan 14 2016   Thu 2016-1-14 13   5AM Orange County 1.994751
#> 7  Thursday Jan 14 2016   Thu 2016-1-14 14   6AM Orange County 1.873360
#> 8  Thursday Jan 14 2016   Thu 2016-1-14 15   7AM Orange County 2.145669
#> 9  Thursday Jan 14 2016   Thu 2016-1-14 16   8AM Orange County 2.736220
#> 10 Thursday Jan 14 2016   Thu 2016-1-14 17   9AM Orange County 3.490814
#> ..                  ...   ...          ...   ...           ...      ...
#> Variables not shown: tide_meters (dbl)
```
Get water temperature for a particular county

```r
county(item = "temp", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> Source: local data frame [1 x 6]
#> 
#>   buoy_id celcius        county fahrenheit         recorded     wetsuit
#>     (int)   (dbl)        (fctr)      (int)           (fctr)      (fctr)
#> 1   46223    15.8 Orange County         60 Y2016 M1 D14 H10 3mm Wetsuit
```
Get wind speed predictions for a particular county

```r
county(item = "wind", county_name = "Orange County") %>%
  dplyr::tbl_df()
#> Source: local data frame [25 x 9]
#> 
#>                    date   day direction_degrees direction_text
#>                   (chr) (chr)             (int)          (chr)
#> 1  Thursday Jan 14 2016   Thu               190              S
#> 2  Thursday Jan 14 2016   Thu               140             SE
#> 3  Thursday Jan 14 2016   Thu               140             SE
#> 4  Thursday Jan 14 2016   Thu               140             SE
#> 5  Thursday Jan 14 2016   Thu               160              S
#> 6  Thursday Jan 14 2016   Thu               160              S
#> 7  Thursday Jan 14 2016   Thu               160              S
#> 8  Thursday Jan 14 2016   Thu                90              E
#> 9  Thursday Jan 14 2016   Thu                90              E
#> 10 Thursday Jan 14 2016   Thu                90              E
#> ..                  ...   ...               ...            ...
#> Variables not shown: gmt (chr), hour (chr), name (chr), speed_kts (int),
#>   speed_mph (dbl)
```
### Spots
List all spots

```r
spot(item = "all") %>%
  dplyr::tbl_df() %>%
  dplyr::filter(county_name == "Santa Barbara") 
#> Source: local data frame [22 x 5]
#> 
#>      county_name latitude longitude spot_id              spot_name
#>            (chr)    (dbl)     (dbl)   (int)                  (chr)
#> 1  Santa Barbara 34.97162 -120.6514     711 Santa Maria Rivermouth
#> 2  Santa Barbara 34.68291 -120.6065     712             Surf Beach
#> 3  Santa Barbara 34.51018 -120.5029     185                 Jalama
#> 4  Santa Barbara 34.46361 -120.1010     713               Tajiguas
#> 5  Santa Barbara 34.46073 -120.0733     620                Refugio
#> 6  Santa Barbara 34.46121 -120.0550     714                Beavers
#> 7  Santa Barbara 34.45657 -120.0212     183             El Capitan
#> 8  Santa Barbara 34.40908 -119.8821     182                  Sands
#> 9  Santa Barbara 34.40604 -119.8778     181               Devereux
#> 10 Santa Barbara 34.40892 -119.8587     715             Pescaderos
#> ..           ...      ...       ...     ...                    ...
```
Get the forecast for a specific spot

```r
spot(item = "forecast", spot_id = 183) %>%
  dplyr::tbl_df()
#> Source: local data frame [25 x 17]
#> 
#>                    date   day          gmt  hour latitude  live longitude
#>                   (chr) (chr)        (chr) (chr)    (dbl) (int)     (dbl)
#> 1  Thursday Jan 14 2016   Thu  2016-1-14 8  12AM 34.45657     0 -120.0212
#> 2  Thursday Jan 14 2016   Thu  2016-1-14 9   1AM 34.45657     0 -120.0212
#> 3  Thursday Jan 14 2016   Thu 2016-1-14 10   2AM 34.45657     0 -120.0212
#> 4  Thursday Jan 14 2016   Thu 2016-1-14 11   3AM 34.45657     0 -120.0212
#> 5  Thursday Jan 14 2016   Thu 2016-1-14 12   4AM 34.45657     0 -120.0212
#> 6  Thursday Jan 14 2016   Thu 2016-1-14 13   5AM 34.45657     0 -120.0212
#> 7  Thursday Jan 14 2016   Thu 2016-1-14 14   6AM 34.45657     0 -120.0212
#> 8  Thursday Jan 14 2016   Thu 2016-1-14 15   7AM 34.45657     0 -120.0212
#> 9  Thursday Jan 14 2016   Thu 2016-1-14 16   8AM 34.45657     0 -120.0212
#> 10 Thursday Jan 14 2016   Thu 2016-1-14 17   9AM 34.45657     0 -120.0212
#> ..                  ...   ...          ...   ...      ...   ...       ...
#> Variables not shown: shape (chr), shape_full (chr), size (int), size_ft
#>   (dbl), spot_id (int), spot_name (chr), warnings (chr),
#>   shape_detail.swell (chr), shape_detail.tide (chr), shape_detail.wind
#>   (chr)
```
List spot near your location

```r
spot(item = "nearby") %>%
  dplyr::tbl_df()
#> Source: local data frame [20 x 7]
#> 
#>    county_id progress spot_id                       spot_id_char
#>        (int)    (int)   (int)                              (chr)
#> 1          9      100     162    pismo-beach-pier-pismo-beach-ca
#> 2         10       10     185                   jalama-lompoc-ca
#> 3         10       11     620                  refugio-goleta-ca
#> 4         10       29     182                sands-isla-vista-ca
#> 5         10       26     181             devereux-isla-vista-ca
#> 6         10       17     179         campus-point-isla-vista-ca
#> 7         10       14     177        leadbetter-santa-barbara-ca
#> 8         10      100     198              rincon-carpinteria-ca
#> 9         11       62     193                  mondos-ventura-ca
#> 10        11       21     191               emma-wood-ventura-ca
#> 11        11      100     190                c-street-ventura-ca
#> 12        12      100     207              county-line-malibu-ca
#> 13        12      100     206               zuma-beach-malibu-ca
#> 14        12      100     205                   malibu-malibu-ca
#> 15        12      100     388                  topanga-malibu-ca
#> 16        12      100     204                   venice-venice-ca
#> 17        12      100     402        el-porto-manhattan-beach-ca
#> 18        12      100     203 manhattan-beach-manhattan-beach-ca
#> 19        12       36     202           hermosa-hermosa-beach-ca
#> 20        12      100     200    torrance-beach-redondo-beach-ca
#> Variables not shown: spot_name (chr), longitude (dbl), latitude (dbl)
```
List neighbors of a given spot

```r
spot(item = "neighbors", spot_id = 1, direction = "above") %>%
  dplyr::tbl_df()
#> Source: local data frame [15 x 7]
#> 
#>    county_id progress spot_id                   spot_id_char
#>        (int)    (int)   (int)                          (chr)
#> 1          1       43     130       three-mile-santa-cruz-ca
#> 2          1      100       6  natural-bridges-santa-cruz-ca
#> 3          1       57     146  stockton-avenue-santa-cruz-ca
#> 4          1       45     145     swift-street-santa-cruz-ca
#> 5          1       64      10         getchell-santa-cruz-ca
#> 6          1       29     144   mitchells-cove-santa-cruz-ca
#> 7          1      100       2     steamer-lane-santa-cruz-ca
#> 8          1      100       3          cowells-santa-cruz-ca
#> 9          1       10     143   the-rivermouth-santa-cruz-ca
#> 10         1       30       9           blacks-santa-cruz-ca
#> 11         1       30       8     santa-marias-santa-cruz-ca
#> 12         1       54       7         26th-ave-santa-cruz-ca
#> 13         1       31     138 little-windansea-santa-cruz-ca
#> 14         1       60     137         rockview-santa-cruz-ca
#> 15         1       87       5       sewer-peak-santa-cruz-ca
#> Variables not shown: spot_name (chr), longitude (dbl), latitude (dbl)
```
Search for a spot with a sequence of parameters 

```r
spot(item = "search", size_min = 3, size_max = 8, shape_min = 1) %>%
  dplyr::tbl_df()
#> Source: local data frame [58 x 16]
#> 
#>              _id field_data_count    score spot_id
#>            (chr)            (int)    (dbl)   (int)
#> 1  622-2016-1-15                2 2.383015     622
#> 2  720-2016-1-15                1 2.205519     720
#> 3  196-2016-1-15                1 2.184183     196
#> 4  126-2016-1-15               20 2.177738     126
#> 5  717-2016-1-15                2 2.164907     717
#> 6  121-2016-1-15               27 2.119744     121
#> 7  128-2016-1-15               29 2.052520     128
#> 8  133-2016-1-15               19 2.046796     133
#> 9  163-2016-1-15              451 1.964041     163
#> 10   2-2016-1-15              589 1.884810       2
#> ..           ...              ...      ...     ...
#> Variables not shown: spot_id_char (chr), spot_name (chr), warnings (int),
#>   average.shape (dbl), average.size (dbl), average.size_max (dbl),
#>   average.size_min (dbl), date_local.dd (int), date_local.mm (int),
#>   date_local.yy (int), longitude (dbl), latitude (dbl)
```
List top spots

```r
spot(item = "top") %>%
  dplyr::tbl_df()
#> Source: local data frame [5 x 5]
#> 
#>   avg_max_size avg_min_size     shape spot_id         spot_name
#>          (int)        (int)     (chr)   (int)             (chr)
#> 1           11            4      Fair     122         Mavericks
#> 2           11            7      Fair     117 South Ocean Beach
#> 3            7            5      Fair     163        Morro Rock
#> 4            7            4      Fair       2      Steamer Lane
#> 5            4            3 Fair-Good       6   Natural Bridges
```

## Resources

* [Spitcast Surf Forecast API Documentation](http://www.spitcast.com/api/docs/)

Be sure to checkout [Spitcast](http://www.spitcast.com/) and read the ['fine
print'](www.spitcast.com/api/docs/):

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

