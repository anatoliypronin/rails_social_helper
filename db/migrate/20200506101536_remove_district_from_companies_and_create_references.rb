# frozen_string_literal: true

class RemoveDistrictFromCompaniesAndCreateReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :district, foreign_key: true, null: false, default: 1
  end
end
