Rails.application.routes.draw do

  scope "/facebook-ads" do 
    get "/admin" => "application#redirect_to_8080" if ENV["DOCKERCOMPOSE"]
  end

  scope "/fbpac-api" do 
    devise_for :partners

    get "heartbeat" => "application#heartbeat"

    # root  :to => redirect('/index.html')
    # get '/admin',  :to => redirect('/admin.html')

    get "loggedin" => "application#loggedin"
    post "loggedin" => "application#loggedin"

    get "states_and_districts" => "ads#states_and_districts"

    resources :ads, only: [:show, :index] do 
      member do 
        put "suppress"
        get "embed"
      end

      collection do 
        get "top_advertising_methods"
        get "summarize"
        get "advertiser"
        get "by_state"

        # for ProPublica 2018 homepage
        # get "persona"
        # get "homepage_stats"
        # get "write_homepage_stats"


        get "by_segments"
        get "by_advertisers"
        get "by_targets"
        get "by_paid_for_by"

        get "this_month_segments"
        get "this_month_advertisers"
        get "this_month_targets"
        get "this_month_paid_for_bys"

        get "this_week_segments"
        get "this_week_advertisers"
        get "this_week_targets"
        get "this_week_paid_for_bys"


        get "this_week_advertisers_first_seen"
        get "this_week_targets_first_seen" # usually blank, maybe not worth displaying
        get "this_week_segments_first_seen"
        get "this_week_paid_for_by_first_seen"

        get "this_month_advertisers_first_seen"
        get "this_month_targets_first_seen"
        get "this_month_segments_first_seen"
        get "this_month_paid_for_bys_first_seen"

        # get "pivot/:kind/:timeperiod/:first_or_not"
      end
    end
  end
end