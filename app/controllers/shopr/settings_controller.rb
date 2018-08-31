module Shopr
  class SettingsController < Shopr::ApplicationController
    before_action { @active_nav = :settings }

    def update
      raise Shopr::Error, t('shopr.settings.demo_mode_error') if Shopr.settings.demo_mode?

      Shopr::Setting.update_from_hash(params[:settings].permit!)
      redirect_to :settings, notice: t('shopr.settings.update_notice')
    end
  end
end
