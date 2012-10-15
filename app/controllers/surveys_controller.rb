class SurveysController < ApplicationController

  def index
    redirect_to :new_survey
  end

  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @survey = Survey.new(params[:survey])

    url= 'https://twitter.com/intent/tweet?original_referer=%s&source=tweetbutton&text=%s&url=%s&via=turpialVe' % [request.url, 'texto', request.url]

    respond_to do |format|
      if @survey.save
        format.html { redirect_to url }
      else
        format.html { render action: "new" }
      end
    end
  end

  def stats
    @operating_systems =Survey.select('operating_system, count(operating_system) as total').group(:operating_system)
    @want_mac = Survey.select('want_mac, count(want_mac) as total').group(:want_mac)
    @use_turpial = Survey.select('use_turpial, count(use_turpial) as total').group(:use_turpial)
  end
end
