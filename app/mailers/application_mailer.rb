# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "human@wibio.me"
  layout "mailer"
end
