class Permission
  extend Forwardable

  def_delegators :user, :admin?, :id

  def initialize(user, controller, action)
    @_user = user || User.new
    @_controller = controller
    @_action = action
  end

  def allow?
    case
    when admin?
      admin_permissions
    when id
      user_permissions
    else
      guest_permissions
    end
  end

  private
    def user
      @_user
    end

    def controller
      @_controller
    end

    def action
      @_action
    end

    def admin_permissions
    end

    def user_permissions
      return true if controller == 'sessions' && action.in?(%w(destroy))
      return true if controller == 'users' && action.in?(%w(show))
    end

    def guest_permissions
      return true if controller == 'sessions' && action.in?(%w(create))
      return true if controller == 'pages' && action.in?(%w(landing))
    end
end
