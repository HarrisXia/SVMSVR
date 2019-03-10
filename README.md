# SVMSVR

Regression and bike_num predicting
<br>Classification and its t-sne visualization

## 1.BikeSharing SVR

This data set contains 731 observations on the daily amount of sharing bikes on the basis of environmental and seasonal settings.
This is a regression problem with both quantitative and qualitative variables.
Feature description:
<br>&nbsp;&nbsp;&nbsp;&nbsp;- instant: record index
<br>&nbsp;&nbsp;&nbsp;&nbsp;- dteday : date
<br>&nbsp;&nbsp;&nbsp;&nbsp;- season : season (1:springer, 2:summer, 3:fall, 4:winter)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- yr : year (0: 2011, 1:2012)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- mnth : month ( 1 to 12)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- holiday : weather day is holiday or not
<br>&nbsp;&nbsp;&nbsp;&nbsp;- weekday : day of the week
<br>&nbsp;&nbsp;&nbsp;&nbsp;- workingday : if day is neither weekend nor holiday is 1, otherwise is 0.
<br>&nbsp;&nbsp;&nbsp;&nbsp;+ weathersit : 
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 1: Clear, Few clouds, Partly cloudy, Partly cloudy
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
<br>&nbsp;&nbsp;&nbsp;&nbsp;- temp : Normalized temperature in Celsius. The values are divided to 41 (max)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- atemp: Normalized feeling temperature in Celsius. The values are divided to 50 (max)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- hum: Normalized humidity. The values are divided to 100 (max)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- windspeed: Normalized wind speed. The values are divided to 67 (max)
<br>&nbsp;&nbsp;&nbsp;&nbsp;- cnt: count of total rental bikes	


## 2.WirelessIndoorLocalization SVM

This data set was collected in indoor space by observing signal strengths of 7 WiFi signals visible on a smartphone. The decision variable (the last column) is one of the four rooms.
This is a multivariate classification problem. There are 2000 data points (samples) each has 7 features.

