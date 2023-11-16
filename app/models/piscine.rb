class Piscine < ApplicationRecord
  belongs_to :user

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

end
