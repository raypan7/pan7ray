# frozen_string_literal: true

require 'digest/md5'

module UsersHelper
  def user_avatar_link(user)
    email_md5 = Digest::MD5.hexdigest(user.email)
    gravatar_url = "https://www.gravatar.com/avatar/#{email_md5}"

    str = "<div class ='user-link'>" + link_to(image_tag(gravatar_url), user_path(user)) + " " + user.display_name + "</div>"

    str.html_safe
  end
end
