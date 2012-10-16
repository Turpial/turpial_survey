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
    # FIXME: Please, this is fucking disgusting
    os = Survey.select('operating_system, count(operating_system) as total').group(:operating_system)
    @operating_systems = '['
    os.each do |o|
      @operating_systems += "['#{o.operating_system.capitalize}',#{o.total}],"
    end
    @operating_systems = @operating_systems[0, @operating_systems.length - 1] + "]"

    @want_mac = '['
    wm = Survey.select('want_mac, count(want_mac) as total').group(:want_mac)
    wm.each do |w|
      @want_mac += "['#{w.want_mac == 0 ? 'No' : w.want_mac == 1 ? 'Yes' : 'Dont care'}', #{w.total}],"
    end
    @want_mac = @want_mac[0, @want_mac.length - 1] + "]"
    @use_turpial = Survey.select('use_turpial, count(use_turpial) as total').group(:use_turpial)
  end
end
