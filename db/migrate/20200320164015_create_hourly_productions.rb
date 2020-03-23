class CreateHourlyProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :hourly_productions do |t|
      t.integer :energy
      t.references :inverter, foreign_key: true
      t.references :total_daily_production, foreign_key: true
      t.datetime :production_hour
      t.timestamps
    end
    add_index :hourly_productions, [:inverter_id, :production_hour], unique: true, name: "hourly_on_inverter_and_daily_index"
  end
end
