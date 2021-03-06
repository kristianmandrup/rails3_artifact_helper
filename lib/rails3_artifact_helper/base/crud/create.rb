module Rails::Assist::CRUD
  module Create             
    def create_artifact name, options={}, &block
      type = get_type(options)
      file = make_file_name(name, type)
      return nil if File.exist?(file)

      create_artifact_dir(file)      
      content = get_content(type, content, options, &block)
      return if content.blank?

      File.overwrite file, content      
    end

    protected
    
    def new_artifact_content name, type, content=nil, &block
      content ||= yield if block
      %Q{class #{marker(name, type)}
  #{content}
end}
    end    

    private

    def content_method type 
      method = :"new_#{type}_content"      
      raise "Content method #{content_method} not found #{orm_notify}" if !respond_to?(method)
    end


    def create_artifact_dir file
      # make dir        
      dir = File.dirname(file)
      FileUtils.mkdir_p dir if !File.directory?(dir)
    end
    
    def get_content type, content, options, &block
      content = block ? yield : options[:content]
      content = type == :model ? content : options.merge(:content => content)          
      send(content_method(type), name, content, &block)
    end    
  end
end