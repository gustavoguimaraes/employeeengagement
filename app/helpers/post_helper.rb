module PostHelper

  def social_media_share(post)
    "<div><strong>Share =></strong>
    <a href='http://twitter.com/home?status=#{post.url}' title='Share on Twitter' target='_blank' class='btn btn-twitter'><i class='fa fa-twitter'></i> Twitter</a>
    <a href='https://www.facebook.com/sharer/sharer.php?u=#{post.url}' title='Share on Facebook' target='_blank' class='btn btn-facebook'><i class='fa fa-facebook'></i> Facebook</a>
    <a href='http://www.linkedin.com/shareArticle?mini=true&url=#{post.url}&title=#{post.title}&summary=#{post.content}' title='Share on LinkedIn' target='_blank' class='btn btn-linkedin'><i class='fa fa-linkedin'></i> LinkedIn</a>
    </div><br>".html_safe
  end

  def post_desc(post)
    "#{social_media_share(post)}
      <div class='image-container'>
      #{link_to image_tag(post.image), format_url(post.url), target: 'blank'}
      </div>
      <h3> Title </h3>
      #{link_to post.title, format_url(post.url), target: "blank"}
      <h3> Description </h3>
      #{post.content}
      <h3> Keywords </h3>
      <p>Maybe Add Keywords later</p>".html_safe
  end

  def approve_or_reject_link(post)
    "<br>
    <div>
       #{link_to post.post_approved, approved_post_path(post), class: "btn btn-success"}
       #{link_to post.post_rejected, rejected_post_path(post), class: "btn btn-warning"}
    </div>
    #{post_desc(post)}".html_safe
  end

  def post_helper(post)
    if post.state == "pending" && current_user.role == "company_admin"
      approve_or_reject_link(post)
    elsif post.state == "approved" && current_user.role == "user"
      post_desc(post)
    else
      ""
    end
  end

end
