module EasyAuth::LinkedIn
  class Engine < ::Rails::Engine
    isolate_namespace EasyAuth::LinkedIn

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
