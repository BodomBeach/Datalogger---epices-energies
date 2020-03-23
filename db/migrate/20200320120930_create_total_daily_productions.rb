class CreateTotalDailyProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :total_daily_productions do |t|
      t.integer :energy
      t.date :production_day

      t.timestamps
    end
    add_index :total_daily_productions, :production_day, unique: true
  end
end
