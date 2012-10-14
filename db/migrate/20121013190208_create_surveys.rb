class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.boolean :use_turpial
      t.string :operating_system
      t.integer :want_mac
      t.text :why_not

      t.timestamps
    end
  end
end
