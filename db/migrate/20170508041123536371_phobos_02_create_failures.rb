class Phobos02CreateFailures < ActiveRecord::Migration[5.1]
  def up
    create_table :phobos_db_checkpoint_failures do |t|
      t.timestamp :created_at,     index: true
      t.string    :topic,          index: true
      t.string    :group_id,       index: true
      t.string    :entity_id,      index: true
      t.timestamp :event_time,     index: true
      t.string    :event_type,     index: true
      t.string    :event_version,  index: true
      t.string    :checksum,       index: true
      t.json      :payload,        index: false
      t.json      :metadata,       index: false
      t.string    :error_class,    index: false
      t.string    :error_message,  index: false
      t.json      :error_backtrace
    end
  end

  def down
    drop_table :phobos_db_checkpoint_failures
  end
end
