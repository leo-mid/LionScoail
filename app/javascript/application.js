// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery

import "@hotwired/turbo-rails"
import "@rails/activestorage"
import "./controllers"

// Foundation setup.
import Foundation from 'foundation-sites'

$(document).on('turbo:load', function () {
  $(document).foundation();
});

// My Custom JavaScript
import "./custom/direct_upload"
