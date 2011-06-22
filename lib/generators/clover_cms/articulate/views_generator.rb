module CloverCms
  module Articulate
    module Generators
      class ViewsGenerator < ::Rails::Generators::Base
        LIB_ROOT_APP_PATH = '../../../../clovercms/articulate/'
        source_root File.expand_path( '../templates', __FILE__ )

        desc "Generates articulate views"
        class_option :haml, :type => :boolean, :default => false, :desc => 'Generates views in haml format'

        def copy_views
          if options.haml
            directory 'haml', 'app/views'
          else
            directory File.expand_path( File.join( LIB_ROOT_APP_PATH, 'app/views' ), __FILE__ ), 'app/views'
          end
        end
      end
    end
  end
end