module CloverCms
  module Articulate
    class Engine < Rails::Engine
      paths.app.controllers << "lib/clovercms/articulate/app/controllers"
      paths.app.models      << "lib/clovercms/articulate/app/models"
      paths.app.views       << "lib/clovercms/articulate/app/views"
      paths.config.locales  << "lib/clovercms/articulate/config/locales"
      paths.config.routes   =  "lib/clovercms/articulate/config/routes.rb"
    end
  end
end
