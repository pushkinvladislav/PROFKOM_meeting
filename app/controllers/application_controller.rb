class ApplicationController < ActionController::Base
  helper_method :get_qrcode

  $monthnames = {
    0 => nil,
    1 => 'января',
    2 => 'февраля',
    3 => 'марта',
    4 => 'ареля',
    5 => 'мая',
    6 => 'июня',
    7 => 'июля',
    8 => 'августа',
    9 => 'сентября',
    10 => 'октября',
    11 => 'ноября',
    12 => 'декабря'
  }

  def get_qrcode(qrcode)
    RQRCode::QRCode.new(qrcode).as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 10,
      standalone: true,
      viewbox: true
    )
  end

end
