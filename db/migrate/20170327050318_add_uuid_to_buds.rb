class AddUuidToBuds < ActiveRecord::Migration[5.0]
  def change
    add_column :buds, :uuid, :string
  end
end
