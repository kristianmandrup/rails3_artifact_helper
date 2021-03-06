module Rails::Assist::Orm
  module DataMapper
    include Rails::Assist::Orm::Base

    def orm_name
      'DataMapper'
    end

    def orm_marker_name options=nil
      "#{orm_name}::Resource"
    end

    def new_model_content name, options={}, &block        
      content = options[:content] || yield if block
      file_w_include(name, orm_marker_name(options)) { content }
    end

    def field_name
      'property'
    end
  end
end