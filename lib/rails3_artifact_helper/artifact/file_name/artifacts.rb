require 'migration_assist'

module Rails::Assist::Artifact
  (Rails::Assist.artifacts - [:migration, :view]).each do |name|
    class_eval %{
      module #{name.to_s.camelize}
        module FileName
        
          def #{name}_file_name name, options=nil
            artifact_path name, :#{name}, options
          end        
        end
        
        include FileName
      end
    }
  end
end  