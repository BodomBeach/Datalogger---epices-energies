class CreateJoinTableTotalDailyProductionsInverters < ActiveRecord::Migration[6.0]
  def change
    create_table :total_daily_productions_inverters do |t|
      t.integer :total_daily_production_id
      t.integer :inverter_id
    end
    add_foreign_key :total_daily_productions_inverters, :total_daily_productions
    add_foreign_key :total_daily_productions_inverters, :inverters
    add_index :total_daily_productions_inverters, [:total_daily_production_id, :inverter_id], name: "total_daily_productions_inverters_index"
  end
end
