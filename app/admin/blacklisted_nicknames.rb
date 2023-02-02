# frozen_string_literal: true

ActiveAdmin.register BlacklistedNickname do
  permit_params :name
end