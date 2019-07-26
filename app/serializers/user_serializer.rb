class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :choruses, :singers
  attributes :auth_info if :authorized
  has_one :profile, serializer: SingerSerializer

  def choruses
    object.choruses.map do |c|
      c.slice(:id, :name)
    end
  end

  def singers
    object.singers.map do |s|
      s.slice(:id, :name)
    end
  end

  def authorized
    return current_user && object.id == current_user.id
  end

  def auth_info
    if current_user && object.id == current_user.id
      return "Authorized"
    else
      return "Not Authorized"
    end

  end
end
