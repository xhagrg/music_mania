json.array! @users, partial: 'user', as: :user, locals: { users: @users, songs: @songs}
