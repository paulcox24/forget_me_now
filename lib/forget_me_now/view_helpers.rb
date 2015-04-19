module ForgetMeNow
  module ViewHelpers
    def forget_me_now(expires_at, options={}, html_content)
      options.merge!(id: "forget_me_not_div", 
                     data: {expires: expires_at}, 
                     style: "display: none;")
      div_to_hide = content_tag 'div', html_content, options
      script_to_run = <<-eos
  $(function () {
    var banner = $('#forget_me_not_div')
    var current = new Date();
    var expiry = new Date(banner.data('expires'));
    //console.log(banner.data('expires'));
    //console.log(expiry);
    if(current.getTime()<expiry.getTime()){
        banner.show();
    }
  })
      eos
      script_to_use = javascript_tag(script_to_run)
      script_to_use + div_to_hide
    end
  end
end