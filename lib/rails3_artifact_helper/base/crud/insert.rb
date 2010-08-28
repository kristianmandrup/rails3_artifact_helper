module Rails::Assist
  module BaseHelper         
    # UPDATE
    def insert_into_artifact name, options={}, &block
      type = get_type(options)
      file = existing_file_name(name, type)
      raise "No file could be determined: #{file} from name: #{name} of type: #{type}" if !file      
      raise "File to insert in not found: #{file} for #{type}" if !File.file?(file)

      options1 = options.merge marker_option(name, type, options)
      
      res = File.insert_into file, options, &block
      if !res
        # try with :embedded option if default doesn't work
        options.merge! marker_option(name, type, options.merge(:model_type => :embedded))

        File.insert_into file, options, &block        
      end
    end 
    alias_method :update_artifact, :insert_into_artifact
  end
end