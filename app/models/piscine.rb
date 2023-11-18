class Piscine < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def format_heure_minutes
      formatted_fields = []
      self.attributes.each do |attr_name, attr_value|
        if attr_value.present? && attr_value.respond_to?(:strftime)
          formatted_fields << attr_value.strftime("%H:%M")
        elsif attr_value.respond_to?(:strftime)
          formatted_fields << "-"
        end
      end
      formatted_fields
    end

    def self.ransackable_attributes(auth_object = nil)
      ["adress", "cp", "created_at", "fridayend", "fridaystart", "id", "mail", "mondayend", "mondaystart", "name", "pays", "saturdayend", "saturdaystart", "sundayend", "sundaystart", "tel", "thursdayend", "thursdaystart", "tuesdayend", "tuesdaystart", "updated_at", "user_id", "ville", "wednesdayend", "wednesdaystart"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["image_attachment", "image_blob", "user"]
    end

end
