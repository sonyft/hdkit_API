class CreateBodygraphRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :bodygraph_records do |t|
      t.string :name
      t.string :birth_date
      t.string :birth_time
      t.string :birth_country
      t.string :birth_city
      t.float :latitude
      t.float :longitude
      t.string :timezone
      t.string :birth_date_utc
      t.string :design_date_utc
      t.string :aura_type
      t.string :inner_authority
      t.string :definition
      t.string :profile
      t.string :incarnation_cross
      t.string :cognition
      t.string :sense
      t.string :variable
      t.string :determination
      t.string :environment
      t.string :view
      t.string :motivation
      t.text :personality_activations
      t.text :design_activations
      t.boolean :head_defined
      t.boolean :ajna_defined
      t.boolean :throat_defined
      t.boolean :spleen_defined
      t.boolean :solar_plexus_defined
      t.boolean :g_center_defined
      t.boolean :sacral_defined
      t.boolean :root_defined
      t.boolean :ego_defined
      t.integer :personality_nodes_tone
      t.integer :design_nodes_tone
      t.text :all_activated_gates

      t.timestamps
    end
  end
end
