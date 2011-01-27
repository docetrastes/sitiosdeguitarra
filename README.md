sitiosdeguitarra
================

Setup on Heroku:
---------------
    heroku create sitiosdeguitarra
    heroku config:add PASSWORD=giraffe
    heroku addons:add custom_domains
    heroku domains:add www.sitiosdeguitarra.com
    heroku domains:add sitiosdeguitarra.com
    
    