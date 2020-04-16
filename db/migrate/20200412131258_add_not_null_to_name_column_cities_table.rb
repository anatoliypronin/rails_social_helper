# frozen_string_literal: true

class AddNotNullToNameColumnCitiesTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :cities, :name, false
  end
end
