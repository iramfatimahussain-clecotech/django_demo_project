class Event < ApplicationRecord
	broadcasts_refreshes
	after_create_commit  -> { broadcast_refresh_later_to(Event) }
  after_update_commit  -> { broadcast_refresh_later }
  after_destroy_commit -> { broadcast_refresh }
end
