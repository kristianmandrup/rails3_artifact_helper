module Rails::Assist::Artifact
  module View
    module FileName
      DEFAULT_TEMPLATE_LANG = 'html.erb'
      DEFAULT_REST_ACTION = 'show'
          
      def view_file_name folder, *args
        action, type, args = get_view_args(args)
        File.expand_path File.join(view_dir, folder.to_s, "#{action}.#{type}")
      end 
      
      def get_view_args args 
        args = args.flatten
        action  = DEFAULT_REST_ACTION
        type    = DEFAULT_TEMPLATE_LANG
        case args.first
        when Hash
          action = args.first.delete(:action)
          type = args.first.delete(:type)
        when String, Symbol     
          action = args.delete_at(0)
        end
        case args.first
        when String, Symbol        
          type = args.delete_at(0)
        end      
        [action, type, args]
      end
    end 
    
    include FileName
  end
end