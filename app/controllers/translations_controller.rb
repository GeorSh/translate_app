class TranslationsController < ApplicationController

  helper_method :history

  def translate_index
    client = Client.new 'trnsl.1.1.20170529T154416Z.047bb57fd7a8b3a1.97c5cf0ccade87d10fb983346cfb5703bf811b3e' 
		lang = params[:priority_lang].present? ? params[:priority_lang] : params[:lang]
    
    result = client.submit 'translate?', lang: lang, text: params[:text]
  	@lang_list = client.submit 'getLangs?', lang: "en"
		@autodetect = client.submit 'detect?', hint: "en,fr,de", text: params[:text]
    @result = result
    render :translate_index
  end

  protected 

  def history
    @history ||= History.new
  end

end
