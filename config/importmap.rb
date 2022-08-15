# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-dropdown" # @2.0.0
pin "hotkeys-js" # @3.9.4
pin "stimulus-use" # @0.50.0
pin "stimulus-sortable" # @3.2.0
