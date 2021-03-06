module Rails::Assist::Orm
  module MongoMapper
    include Rails::Assist::Orm::Base

    def orm_name
      'MongoMapper'
    end      
  
    def new_model_content name, options={}, &block        
      content = options[:content] || yield if block
      file_w_include(name, orm_marker_name(options)) { content }
    end

    def field_name
      'key'
    end
  end
end