module PostHelper

  def post_desc(post)
    "<div class='row posts-spacing'>
      #{link_to image_tag(post.image), format_url(post.url), target: 'blank'}
      <h3> Title </h3>
      #{link_to post.title, format_url(post.url), target: "blank"}
      <h3> Description </h3>
      #{post.content}
      <h3> Keywords </h3>
      <p>Maybe Add Keywords later</p>
    </div>".html_safe
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
    if post.state == "pending" && current_user.role != "user"
     if post.state == "pending"
       approve_or_reject_link(post)
     end
    elsif post.state == "approved" && current_user.role == "user"
      post_desc(post)
    end
  end

end
