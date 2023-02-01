# frozen_string_literal: true

ActiveAdmin.register Link do
  permit_params :name, :url, :position
end
