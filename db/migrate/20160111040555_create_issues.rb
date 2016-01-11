class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :item
      t.string :function
      t.string :failure
      t.string :effect_of_failure
      t.string :cause_of_failure
      t.string :current_controls
      t.string :recommended_actions
      t.integer :probability_estimate
      t.integer :severity_estimate
      t.integer :detection_indicators
      t.integer :detection_dormancy_period
      t.integer :risk_level
      t.string :further_investigation

      t.timestamps null: false
    end
  end
end
