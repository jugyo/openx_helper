module ApplicationHelper
  module OpenXHelper
    def openx_banner(zone_id)
      unless session["OAID"]
        oaid = session.session_id
        session["OAID"] = oaid
      else
        oaid = session["OAID"]
      end
      OpenX::Services::Zone.deliver(zone_id, request.remote_ip, {"OAID" => oaid})["html"]
    end
  end
  include OpenXHelper
end
