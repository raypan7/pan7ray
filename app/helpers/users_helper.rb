# frozen_string_literal: true

require 'digest/md5'

module UsersHelper
  def user_avatar_link(user)
    email_md5 = Digest::MD5.hexdigest(user.email)
    gravatar_url = "https://picsum.photos/id/#{user.id + 120}/50"

    str = "<div class ='user-link'>" + link_to(image_tag(gravatar_url), user_path(user)) + " " + user.display_name + "</div>"

    str.html_safe
  end
end
