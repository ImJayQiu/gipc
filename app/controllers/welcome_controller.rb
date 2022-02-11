class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  layout :resolve_layout

  def sirmodel
    @provinces = Province.all
  end

  def sir_output

    sdate = params[:s_date] 

    edate = params[:e_date]

    days = params[:days].first.to_i 

    @province = params[:province].first.to_s

    @s = params[:susceptible].first.to_i

    @beta = params[:beta].first.to_f 

    @gamma = params[:gamma].first.to_f 

    @lambda = params[:lambda].first.to_f 

    @delta = params[:delta].first.to_f 

    @population = Province.where(name: @province).first.population

    @sdate = sdate.first rescue nil

    @edate = edate.first rescue nil

    @date_range = (@sdate .. @edate).to_a rescue nil

    ################ SIR Parameters ##################################################3

    # Susceptible
    s = @s

    # Infected 
    i = @i = Covid19case.where(notification_date: @date_range, status: "Hospitalized", qua_district: @province).count 

    # Recovered
    r = @r = Covid19case.where(notification_date: @date_range, status: "Recovered", qua_district: @province).count 

    # Dead
    d = @d = Covid19case.where(notification_date: @date_range, status: "Dead", qua_district: @province).count 


    e = @e = 0

    #################  SIR model #######################################

    @final_S = []
    @final_E = []
    @final_I = []
    @final_R = []

    days.times do 

      se = ( i * s * @beta ) / ( s + i + r + d )

      id = i * @delta * @gamma

      ir = i * @gamma

      ei = e * @gamma 

      s = (s - se).round(2) 
      @final_S << s

      i = (i + ei - id - ir).round(2)
      @final_I << i

      e = (e + se -ei).round(2)
      @final_E << e

      r = (r + ir).round(2)
      @final_R << r

    end

    ####################################################################
  end


  def index
  end

  def summary 

    @search_range = params["ranges"]

    sdate = @search_range["s_date"] rescue nil 

    edate = @search_range["e_date"] rescue nil 

    #sdate = params[:s_date] rescue nil
    #edate = params[:e_date] rescue nil

    @sdate = sdate rescue nil

    @edate = edate rescue nil

    @date_range = (@sdate .. @edate).to_a rescue nil

    @districts = Province.where(admlevel: "District").all

    @provinces = Province.where(admlevel: "Province").all

    if @date_range.blank? 
      @summary_cases = Covid19case.order(:notification_date).all rescue nil 
      @start_date = @summary_cases.first.notification_date rescue nil
      @end_date = @summary_cases.last.notification_date rescue nil
    else
      @summary_cases = Covid19case.where(notification_date: @date_range).all rescue nil 
      @start_date = @date_range.first rescue nil
      @end_date = @date_range.last rescue nil
    end

  end

  def medical_capacity_summary 
    @provinces = Province.all
  end

  def living_supply_summary 

    @districts = Province.where(admlevel: "District").all

    #@provinces = Province.where(admlevel: "Province").all

  end

  def vaccine_register_summary 
    @provinces = Province.all
  end

  def details 
    @province = params[:province]
    @supply_type = params[:supply_type]

    if @supply_type == "Medical"
      @details_data =  Medicalsupply.where(province: @province)
    elsif @supply_type == "Living"
      @details_data =  Livingsupply.where(province: @province)
    end

    if @supply_type == "Medical"
      @title =   "Details of medical Capacity of #{@province}"
    elsif @supply_type == "Living"
      @title = "Details of living supply of #{@province}"
    end

  end




  private

  def resolve_layout

    case action_name

    when "index"
      "index"
    when "summary"
      "summary"
    when "medical_capacity_summary" 
      "summary"
    when "living_supply_summary" 
      "summary"
    when "vaccine_register_summary" 
      "summary"
    when "sirmodel" 
      "summary"
    else
      "application"
    end

  end

end
