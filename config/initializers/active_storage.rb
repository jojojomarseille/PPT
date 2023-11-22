ActiveSupport.on_load(:active_storage_attachment) do
  class ActiveStorage::Attachment < ActiveStorage::Record
    def self.ransackable_attributes(auth_object = nil)
      %w[blob_id created_at id name record_id record_type]
    end
  end
end