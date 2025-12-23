class CreateEnrollmentRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollment_requests do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :batch, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
