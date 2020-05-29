module ScopeHelper
  def decorate_user
    User.decorate
  end

  def decorate_comment
    Comment.decorate
  end
end
