require 'test_helper'
require File.expand_path( "../../lib/generators/clover_cms/articulate/views_generator.rb", File.dirname( __FILE__ ) )

class ViewsGeneratorTest < Rails::Generators::TestCase
  tests CloverCms::Articulate::Generators::ViewsGenerator
  destination File.expand_path( "../../tmp", File.dirname( __FILE__ ) )
  setup :prepare_destination

  test 'views get copied' do
    run_generator
    assert_directory 'app/views/dashboard'
    assert_directory 'app/views/layouts'
    assert_directory 'app/views/shared'
  end

  test 'haml views get copied' do
    run_generator '--haml'
    assert_directory 'app/views/dashboard'
    assert_directory 'app/views/dashboard/articles'
    assert_file 'app/views/dashboard/articles/index.html.haml'
  end
end