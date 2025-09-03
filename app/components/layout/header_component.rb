class Layout::HeaderComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  
  def initialize(current_page: nil)
    @current_page = current_page
  end

  private

  attr_reader :current_page

  def navigation_items
    items = [
      { title: "Home", path: root_path, active: current_page == "home" },
      { title: "Classes", path: ballet_levels_path, active: current_page == "classes" },
      { title: "Timetable", path: timetable_path(id: "current"), active: current_page == "timetable" },
      { title: "Enrol", path: new_enrolment_path, active: current_page == "enrol" },
      { title: "Parent Portal", path: "https://app.jackrabbitclass.com/jr3.0/ParentPortal/Login?orgId=548595", active: false, external: true }
    ]
    
    # Add admin links if user is signed in
    if administrator_signed_in?
      items << { title: "Admin", path: admin_timetables_path, active: current_page == "admin" }
      items << { title: "Sign Out", path: destroy_administrator_session_path, active: false, method: :delete }
    end
    
    items
  end
end
