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
    # OS stats
    os = Survey.select('operating_system, count(operating_system) as total').group(:operating_system)
    @operating_systems = "[" + os.collect{|o| "['#{o.operating_system.capitalize}', #{o.total}]" }.join(",") + "]"

    # Want Mac stats
    wm = Survey.select('want_mac, count(want_mac) as total').group(:want_mac)
    @want_mac = "[" + wm.collect{|w| "['#{w.humanize_want_mac}', #{w.total}]" }.join(",") + "]"

    # Use Turpial stats
    @use_turpial = Survey.select('use_turpial, count(use_turpial) as total').group(:use_turpial)

    # Trend stats
    ut = Survey.select("left(created_at, 10) as date, count(use_turpial) as total").group("left(created_at, 10)")
    @trend = {
      :dates => "['" + ut.collect{|d| d.date}.join("','") + "']",
      :users => "[" + ut.collect{|d| d.total}.join(",") + "]",
    }
  end
end
