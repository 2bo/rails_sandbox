# frozen_string_literal: true

class AddJtiToUsers < ActiveRecord::Migration[7.1]
  def change
    # JTI stands for JWT ID, and it is a standard claim meant to uniquely identify a token.
    add_column :users, :jti, :string, null: false # rubocop:disable Rails/NotNullColumn
    add_index :users, :jti, unique: true
  end
end
