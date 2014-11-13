Recaptcha.configure do |config|

  if Rails.env.production? 
    #www.drifters.com.tw
    # config.public_key  = '6LfPNf0SAAAAADN5hCOCTwZMT6eUAQ4pop25kN8Q'
    # config.private_key = '6LfPNf0SAAAAACLqUi5XyWhncQkAMa-Dxp3Y2uIM'
    #Temporary: drifters.summers.com.tw
    config.public_key  = '6LdbNP0SAAAAAIa8K09VuScQAYKg0Q03nmz-QSUC'
    config.private_key = '6LdbNP0SAAAAAHU0jaW4AiSxcOc7jz15nuVWD5OA'

  else 
    #Temporary: www.drifters.com.tw
    config.public_key  = '6LfPNf0SAAAAADN5hCOCTwZMT6eUAQ4pop25kN8Q'
    config.private_key = '6LfPNf0SAAAAACLqUi5XyWhncQkAMa-Dxp3Y2uIM'
    
  end
end