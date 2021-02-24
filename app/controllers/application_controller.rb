class ApplicationController < ActionController::Base
  helper_method :get_qrcode

  def get_qrcode(qrcode)
    RQRCode::QRCode.new(qrcode).as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 10,
      standalone: true
    )
  end
end
