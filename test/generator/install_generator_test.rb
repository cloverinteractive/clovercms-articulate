require 'test_helper'
require File.expand_path( "../../lib/generators/clover_cms/articulate/install/install_generator.rb", File.dirname( __FILE__ ) )

class InstallGeneratorTest < Rails::Generators::TestCase
  tests CloverCms::Articulate::Generators::InstallGenerator
  destination File.expand_path( "../../tmp", File.dirname( __FILE__ ) )
  setup :prepare_destination

  # Disbale timestamped migrations to predict the migration number
  ActiveRecord::Base.timestamped_migrations = false

  test "migration gets properly created" do
    run_generator
    assert_file "db/migrate/001_create_articles.rb", /create_table/
  end

  test "model gets copied" do
    run_generator
    assert_file "app/models/article.rb", /Article/
  end

  test "locales get copied" do
    run_generator
    %w/es en/.each do |locale|
      assert_file "config/locales/articulate.#{ locale }.yml", /#{ locale }:/
    end
  end
end
