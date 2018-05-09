module Catapult
  class Config::CatapultNode
    class TemplateAttributes
      require_relative('template_attributes/per_index')
      def initialize(type, component_keys, input_attributes)
        @type               = type
        @component_keys     = component_keys
        @input_attributes = input_attributes
      end
        
      attr_reader :type, :component_keys, :namespace
      
      def hash(index)
        PerIndex.new(self, index).hash
      end
      
      def harvest_keys
        @harvest_keys ||= Config::Keys::Nemesis.get_keys_info_array_for_harvesting(self.input_attributes).map(&:private)
      end
      
      protected

      attr_reader :input_attributes

    end        
  end
end



 
