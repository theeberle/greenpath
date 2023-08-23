// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

//  For statistics (Chartkick)
import "chartkick"
import "Chart.bundle"
import Highcharts from "highcharts"
window.Highcharts = Highcharts
