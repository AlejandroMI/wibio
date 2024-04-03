# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :nickname, :full_name, :about

  index do
    selectable_column
    id_column

    column :full_name
    column :email
    actions
  end
end
