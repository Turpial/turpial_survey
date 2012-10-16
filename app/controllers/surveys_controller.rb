class SurveysController < ApplicationController

  def index
    redirect_to :new_survey
  end

  def new
    @survey = Survey.new
    @lang = params['lang'] || 'es'

    respond_to do |format|
      format.html
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    @tweet_url = "https://twitter.com/intent/tweet?original_referer=#{@url}&source=tweetbutton&text=#{CGI.escape(I18n.t('tweet_text'))}&url=#{@url}&via=turpialVe"
    respond_to do |format|
      if verify_recaptcha(:model => @survey, :message => I18n.t('recaptcha.errors.verification_failed')) && @survey.save
        format.html
      else
        format.html { render :action => "new" }
      end
    end
  end

  def stats
    @operating_systems =Survey.select('operating_system, count(operating_system) as total').group(:operating_system)
    @want_mac = Survey.select('want_mac, count(want_mac) as total').group(:want_mac)
    @use_turpial = Survey.select('use_turpial, count(use_turpial) as total').group(:use_turpial)
  end
end
