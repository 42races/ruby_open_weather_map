$LOAD_PATH << '../lib'

require 'base'
require 'open_weather/api'
require 'open_weather/errors'

autoload :Current,       'open_weather/current'
autoload :Forecast,      'open_weather/forecast'
autoload :ForecastDaily, 'open_weather/forecast_daily'
autoload :VERSION,       'open_weather/version'