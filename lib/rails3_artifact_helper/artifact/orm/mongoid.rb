module Rails::Assist::Orm
  module Mongoid
    include Rails::Assist::Orm::Base

    def orm_name
      'Mongoid'
    end

    def field_name
      'field'
    end

    def new_model_content name, options={}, &block        
      content = options[:content] || yield if block
      file_w_include(name, orm_marker_name(options)) { content }
    end

    def field name, type = nil
      return "#{field_name} :#{name}, :type => #{type}" if type
      "#{field_name} :#{name}"
    end
  end
end