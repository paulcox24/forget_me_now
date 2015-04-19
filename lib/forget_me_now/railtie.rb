require 'forget_me_not/view_helpers'

module ForgetMeNow
  class Railtie < Rails::Railtie
    # for example, if you want to extend ViewHelpers
    initializer 'forget_me_now.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end