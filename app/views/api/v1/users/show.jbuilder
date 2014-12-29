json.( @user, :email )

json.topics @user.topics, :name

json.notifications @user.notifications, :body