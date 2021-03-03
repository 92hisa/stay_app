module ApplicationHelper
  def avatar_url(user)
    return user.profile_photo unless user.profile_photo.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://techpit-market-prod.s3.amazonaws.com/uploads/part_attachment/file/15782/2da91636-af73-4eed-91cd-320a0399609c.jpg"
  end
  
  def text_placeholder
  <<-"EOS".strip_heredoc
    （記入例）
    福岡市天神にあるセカンドハウスを１回２泊以上よりお貸しします。
  EOS
  end
  
  def address_placeholder
  <<-"EOS".strip_heredoc
    （例）東京都品川区
  EOS
  end

  
end
