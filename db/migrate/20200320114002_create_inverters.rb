class CreateInverters < ActiveRecord::Migration[6.0]
  def change
    create_table :inverters do |t|
      t.timestamps
    end
  end
end
