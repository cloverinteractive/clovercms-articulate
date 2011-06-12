require 'rails/generators/migration'

module CloverCms
  module Articulate
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration

        desc "Generate clovercms-articulate migrations"

        source_root File.expand_path('../../templates', __FILE__)

        def self.next_migration_number(path)
          if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime("%Y%m%d%H%M%S")
          else
            "%.3d" % (current_migration_number(path) + 1)
          end
        end

        def create_migration
          migration_template "create_articles.rb", "db/migrate/create_articles.rb"
        end

        def show_readme
          readme "README" if behavior == :invoke
        end
      end
    end
  end
end
