# SVMSVR

1.BikeSharing SVM
-------------
This data set contains 731 observations on the daily amount of sharing bikes on the basis of environmental and seasonal settings.
This is a regression problem with both quantitative and qualitative variables.
Feature description:
	- instant: record index
	- dteday : date
	- season : season (1:springer, 2:summer, 3:fall, 4:winter)
	- yr : year (0: 2011, 1:2012)
	- mnth : month ( 1 to 12)
	- holiday : weather day is holiday or not
	- weekday : day of the week
	- workingday : if day is neither weekend nor holiday is 1, otherwise is 0.
	+ weathersit : 
		- 1: Clear, Few clouds, Partly cloudy, Partly cloudy
		- 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
		- 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
		- 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
	- temp : Normalized temperature in Celsius. The values are divided to 41 (max)
	- atemp: Normalized feeling temperature in Celsius. The values are divided to 50 (max)
	- hum: Normalized humidity. The values are divided to 100 (max)
	- windspeed: Normalized wind speed. The values are divided to 67 (max)
	- cnt: count of total rental bikes	

2.WirelessIndoorLocalization
-------------
This data set was collected in indoor space by observing signal strengths of 7 WiFi signals visible on a smartphone. The decision variable (the last column) is one of the four rooms.
This is a multivariate classification problem. There are 2000 data points (samples) each has 7 features.

