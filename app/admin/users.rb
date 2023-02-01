# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :nickname, :full_name, :about
end
