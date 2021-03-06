class Phobos01CreateEvents < ActiveRecord::Migration[5.1]
  def up
    create_table :phobos_db_checkpoint_events do |t|
      t.string    :topic,         index: true
      t.string    :group_id,      index: true
      t.string    :entity_id,     index: true
      t.timestamp :event_time,    index: true
      t.string    :event_type,    index: true
      t.string    :event_version, index: true
      t.string    :checksum,      index: true
      t.json      :payload
    end

    add_index :phobos_db_checkpoint_events, [:topic, :group_id, :checksum], name: :index_phobos_db_checkpoint_events_on_topic_group_id_checksum
  end

  def down
    drop_table :phobos_db_checkpoint_events
  end
end
