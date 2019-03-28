RailsAdmin.config do |config|
  config.navigation_static_links = {
    'Google' => 'http://www.google.com'
  }
  config.authenticate_with do
     warden.authenticate! scope: :admin
     config.main_app_name = Proc.new { |controller| [ "Rocketelevator", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
 
   end
   config.current_user_method(&:current_admin)
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :admin
  # end
  # config.current_admin_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'Admin', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

end
