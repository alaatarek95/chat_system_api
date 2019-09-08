class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|

      t.string :job_type
      t.string :status
      t.text :job_args
      t.timestamps
    end
  end
end
