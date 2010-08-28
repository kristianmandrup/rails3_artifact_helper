module Rails::Assist
  module BaseHelper
    # DELETE
    def remove_artifact name, type
      file = make_file_name name, type
      debug "removed artifact: #{name}" if File.exist?(file) && FileUtils.rm_f(file) 
    end
    alias_method :delete_artifact, :remove_artifact

    def remove_artifacts type,*names
      names.flatten.each{|name| send :"remove_#{type}", name }
    end
    alias_method :delete_artifacts, :remove_artifacts
    
    def remove_content_from type, *names, replacement_expr=nil, &block
      names.flatten.each do |name|
        file = existing_file_name(name, type)
        File.remove_content_from file, replacement_expr=nil, &block
      end
    end  
    
    # TODO
    alias_methods_for :remove_content_from, :delete_content_from, :delete_from, :remove_from
  end
end