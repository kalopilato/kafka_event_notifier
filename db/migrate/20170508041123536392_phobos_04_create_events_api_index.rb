class Phobos04CreateEventsApiIndex < ActiveRecord::Migration[5.1]
  def up
    say 'Adding events api indices'
    add_index :phobos_db_checkpoint_events,
      [:event_time, :created_at],
      name: :phobos_events_event_time_created_at_desc_nulls_last_idx,
      order: {event_time: 'desc nulls last', created_at: 'desc nulls last'},
      using: :btree

    add_index :phobos_db_checkpoint_failures,
      [:event_time, :created_at],
      name: :phobos_failures_event_time_created_at_desc_nulls_last_idx,
      order: {event_time: 'desc nulls last', created_at: 'desc nulls last'},
      using: :btree

    say 'Removing unused indices'
    remove_index :phobos_db_checkpoint_events, name: :phobos_events_event_time_desc_nulls_last_idx
    remove_index :phobos_db_checkpoint_events, name: :phobos_events_created_at_desc_nulls_last_idx
    remove_index :phobos_db_checkpoint_failures, name: :phobos_failures_event_time_desc_nulls_last_idx
    remove_index :phobos_db_checkpoint_failures, name: :phobos_failures_created_at_desc_nulls_last_idx
  end

  def down
    say 'Removing new events api indices'
    remove_index :phobos_db_checkpoint_events, name: :phobos_events_event_time_created_at_desc_nulls_last_idx
    remove_index :phobos_db_checkpoint_failures, name: :phobos_failures_event_time_created_at_desc_nulls_last_idx

    say 'Adding old indices back'
    add_index :phobos_db_checkpoint_events,
      [:event_time],
      name: :phobos_events_event_time_desc_nulls_last_idx,
      order: {event_time: 'desc nulls last'},
      using: :btree

    add_index :phobos_db_checkpoint_events,
      [:created_at],
      name: :phobos_events_created_at_desc_nulls_last_idx,
      order: {created_at: 'desc nulls last'},
      using: :btree

    add_index :phobos_db_checkpoint_failures,
      [:event_time],
      name: :phobos_failures_event_time_desc_nulls_last_idx,
      order: {event_time: 'desc nulls last'},
      using: :btree

    add_index :phobos_db_checkpoint_failures,
      [:created_at],
      name: :phobos_failures_created_at_desc_nulls_last_idx,
      order: {created_at: 'desc nulls last'},
      using: :btree
  end
end
