
class TranslationsController < ApplicationController

  def translate

    client = Client.new 'trnsl.1.1.20170529T154416Z.047bb57fd7a8b3a1.97c5cf0ccade87d10fb983346cfb5703bf811b3e' 
		lang = params[:priority_lang].present? ? params[:priority_lang] : params[:lang]
  	@result = client.submit 'translate?', lang: lang, text: params[:text]
  	@lang_list = client.submit 'getLangs?', lang: "en"
		@autodetect = client.submit 'detect?', hint: "en,fr,de", text: params[:text]
    # @client = HTTPClient.new
    
    
    # base_url = "https://translate.yandex.net/api/v1.5/tr.json//translate?lang=en-ru&key=trnsl.1.1.20170807T122841Z.cb9d4dcb27d275a5.1d40182978fd9f197382d893850302497f62b055&text=Hello World!"
    # uri = URI.escape(base_url)
    # @res = @client.post(uri)
    # @o = Yatranslate::Client.new 'trnsl.1.1.20170529T154416Z.047bb57fd7a8b3a1.97c5cf0ccade87d10fb983346cfb5703bf811b3e'
    # o = YatranslateAPI::Client.new 'trnsl.1.1.20170807T122841Z.cb9d4dcb27d275a5.1d40182978fd9f197382d893850302497f62b055'
    # lang = params[:priority_lang].present? ? params[:priority_lang] : params[:lang]
    # @result = o.submit 'translate?', lang: lang, text: params[:text]
    # @lang_list = o.submit 'getLangs?', lang: "en"
    # @autodetect = o.submit 'detect?', hint: "en,fr,de", text: params[:text] 
    render :translate
  end

end
